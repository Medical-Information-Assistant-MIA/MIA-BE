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

      describe "error responses" do 
        it "renders an error if a medication id does not exist" do 
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          medication = create(:medication, condition_id: condition.id)

          post '/graphql', params: { query: query(id: 333, name: "Red pill") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:updateMedication][:errors]).to eq(["record-not-found"])
          expect(data[:data][:updateMedication][:success]).to eq(false)
        end
      end

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