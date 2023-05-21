require "rails_helper"

module Mutations
  module Medications
    RSpec.describe CreateMedication, type: :request do
      describe ".resolve" do
        it "creates a medication" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)

          expect(Medication.count).to eq(0)

          post "/graphql",
            params: { query: query(conditionId: condition.id, name: "Tylenol", datePrescribed: Date.today, dosage: "250mg",
                                      frequency: "2 every 6 hours as needed", prescribedBy: "Dr Pepperdine") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(Medication.count).to eq(1)
          expect(response).to be_successful
          expect(data[:data]).to have_key(:createMedication)
          expect(data[:data][:createMedication].keys).to eq(%i[medication errors])
          expect(data[:data][:createMedication][:medication][:id]).to be_a(Integer)
          expect(data[:data][:createMedication][:medication][:name]).to eq("Tylenol")
          expect(data[:data][:createMedication][:medication][:datePrescribed]).to be_a(String)
          expect(data[:data][:createMedication][:medication][:dosage]).to eq("250mg")
          expect(data[:data][:createMedication][:medication][:frequency]).to eq("2 every 6 hours as needed")
          expect(data[:data][:createMedication][:medication][:prescribedBy]).to eq("Dr Pepperdine")
          expect(data[:data][:createMedication][:medication][:conditionId]).to eq(condition.id)
        end
      end

      describe "error response" do
        it "renders an error if a required field is not provided" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)

          expect(Medication.count).to eq(0)

          post "/graphql",
               params: { query: query(conditionId: condition.id, name: nil, datePrescribed: Date.today, dosage: "250mg", frequency: "2 every 6 hours as needed",
                                      prescribedBy: "Dr Pepperdine") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:createMedication][:errors]).to eq(["Name can't be blank"])
        end
      end

      def query(conditionId:, name:, datePrescribed:, dosage:, frequency:, prescribedBy:)
        <<~GQL
          mutation {
            createMedication(input: {
              name: "#{name}"
              conditionId: #{conditionId}
              datePrescribed: "#{datePrescribed}"
              dosage: "#{dosage}"#{' '}
              frequency: "#{frequency}"#{' '}
              prescribedBy: "#{prescribedBy}"
            }) {
              medication {
                id
                name
                conditionId
                datePrescribed
                dosage
                frequency
                prescribedBy
              }
              errors
            }
          }
        GQL
      end
    end
  end
end
