require "rails_helper"

module Mutations
  module Doctors
    RSpec.describe UpdateDoctor, type: :request do
      describe ".resolve" do
        it "updates a doctor" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          doctor = create(:doctor, condition_id: condition.id)
          expect(doctor.name).to_not eq("Dr. Jenny")

          post "/graphql",
            params: { query: query(id: doctor.id, name: "Dr. Jenny") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(response).to be_successful
          expect(data[:data]).to have_key(:updateDoctor)
          expect(data[:data][:updateDoctor][:doctor][:name]).to eq("Dr. Jenny")
          expect(data[:data][:updateDoctor][:success]).to be(true)
          expect(data[:data][:updateDoctor][:doctor][:conditionId]).to eq(condition.id)
        end
      end

      describe "error responses" do
        it "renders an error if a doctor id does not exist" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          doctor = create(:doctor, condition_id: condition.id)

          post "/graphql", params: { query: query(id: 333, name: "Dr. Jenny") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:updateDoctor][:errors]).to eq(["record-not-found"])
          expect(data[:data][:updateDoctor][:success]).to eq(false)
        end
      end

      def query(name:, id:)
        <<~GQL
          mutation {
            updateDoctor(input: {
              name: "#{name}"
              id: #{id}
            }) {
              doctor {
                id
                name
                conditionId
                phone
                address
                category
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