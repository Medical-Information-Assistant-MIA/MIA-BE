require "rails_helper"

module Mutations
  module Medications
    RSpec.describe DestroyMedication, type: :request do
      describe ".resolve" do
        it "destroys a medication" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          medication = create(:medication, condition_id: condition.id)
          expect(Medication.count).to eq(1)

          post "/graphql", params: { query: query(id: medication.id) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(response).to be_successful
          expect(data[:data][:destroyMedication][:success]).to eq(true)
          expect(Medication.count).to eq(0)
        end
      end

      describe "error responses" do
        it "renders an error if a condition id does not exist" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          medication = create(:medication, condition_id: condition.id)
          expect(Medication.count).to eq(1)

          post "/graphql", params: { query: query(id: 333) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:destroyMedication][:errors]).to eq(["Medication not found"])
          expect(data[:data][:destroyMedication][:success]).to eq(false)
          expect(Medication.count).to eq(1)
        end

        it "renders an error if the deletion fails" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          medication = create(:medication, condition_id: condition.id)
          expect(Medication.count).to eq(1)

          allow(Medication).to receive(:find_by).and_return(medication)
          allow(medication).to receive(:destroy).and_return(false)
          allow(medication).to receive_message_chain(:errors, :full_messages).and_return(["Medication deletion failed"])

          post "/graphql", params: { query: query(id: medication.id) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:destroyMedication][:errors]).to eq(["Medication deletion failed"])
          expect(data[:data][:destroyMedication][:success]).to eq(false)
          expect(Medication.count).to eq(1)
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            destroyMedication(input: {
              id: #{id}
            }) {
              errors
              success
            }
          }
        GQL
      end
    end
  end
end