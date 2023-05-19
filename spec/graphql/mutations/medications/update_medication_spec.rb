require "rails_helper" 

module Mutations 
  module Medications 
    RSpec.describe UpdateMedication, type: :request do
      describe ".resolve" do 
        it "updates a medication" do 
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          medication = create(:medication, condition_id: condition.id)

          post '/graphql', params: { query: query(id: medication.id, name: "Advil") }
          data = JSON.parse(response.body, symbolize_names: true)
      
          expect(response).to be_successful
          expect(data[:data]).to have_key(:updateMedication)
          expect(data[:data][:updateMedication].keys).to eq([:medication, :errors, :success])
          expect(data[:data][:updateMedication][:success]).to eq(true)
          expect(data[:data][:updateMedication][:medication][:id]).to be_a(Integer)
          expect(data[:data][:updateMedication][:medication][:name]).to eq("Advil")
          expect(data[:data][:updateMedication][:medication][:datePrescribed]).to be_a(String)
          expect(data[:data][:updateMedication][:medication][:dosage]).to be_a(String)
          expect(data[:data][:updateMedication][:medication][:frequency]).to be_a(String)
          expect(data[:data][:updateMedication][:medication][:prescribedBy]).to be_a(String)
          expect(data[:data][:updateMedication][:medication][:conditionId]).to eq(condition.id)

        end
      end

      # describe "error response" do 
      #   it "renders an error if a required field is not provided" do 
      #     user = create(:user)
      #     condition = create(:condition, user_id: user.id)

      #     expect(Medication.count).to eq(0)

      #     post '/graphql', params: { query: query(conditionId: condition.id, name: nil, datePrescribed: Date.today, dosage: "250mg", frequency: "2 every 6 hours as needed", prescribedBy: "Dr Pepperdine") }
      #     data = JSON.parse(response.body, symbolize_names: true)

      #     expect(data[:data][:createMedication][:errors]).to eq(["Name can't be blank"])
      #   end
      # end

      def query(id:, name:)
        <<~GQL
        mutation {
          updateMedication(input: {
            name: "#{name}"
            id: #{id}
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
            success
          }
        }
        GQL
      end
    end
  end
end