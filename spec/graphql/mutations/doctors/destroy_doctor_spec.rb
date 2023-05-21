require "rails_helper"

module Mutations
  module Doctors
    RSpec.describe DestroyDoctor, type: :request do
      describe ".resolve" do
        it "destroys a doctor" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          doctor = create(:doctor, condition_id: condition.id)
          expect(Doctor.count).to eq(1)

          post "/graphql", params: { query: query(id: doctor.id) }
          data = JSON.parse(response.body, symbolize_names: true)
          
          expect(response).to be_successful
          expect(data[:data][:destroyDoctor][:success]).to eq(true)
          expect(Doctor.count).to eq(0)
        end
      end

      describe "error responses" do
        it "renders an error if a doctor id does not exist" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          doctor = create(:doctor, condition_id: condition.id)
          expect(Doctor.count).to eq(1)

          post "/graphql", params: { query: query(id: 333) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:destroyDoctor][:errors]).to eq(["Doctor not found"])
          expect(data[:data][:destroyDoctor][:success]).to eq(false)
          expect(Doctor.count).to eq(1)
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            destroyDoctor(input: {
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