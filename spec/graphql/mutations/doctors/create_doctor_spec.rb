require "rails_helper"

module Mutations
  module Doctors
    RSpec.describe CreateDoctor, type: :request do
      describe ".resolve" do
        it "creates a doctor" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          expect(Doctor.count).to eq(0)

          post "/graphql", params: { query: query(conditionId: condition.id, name: "Dr. Jenny", phone: "555-867-5309", address: "123 Healthy Ave.", category: "Cardiologist") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(Doctor.count).to eq(1)
          expect(response).to be_successful
          expect(data[:data][:createDoctor][:doctor][:id]).to be_a(Integer)
          expect(data[:data][:createDoctor][:doctor][:name]).to eq("Dr. Jenny")
          expect(data[:data][:createDoctor][:doctor][:phone]).to eq("555-867-5309")
          expect(data[:data][:createDoctor][:doctor][:address]).to eq("123 Healthy Ave.")
          expect(data[:data][:createDoctor][:doctor][:category]).to eq("Cardiologist")
        end
      end

      def query(conditionId:, name:, phone:, address:, category:)
        <<~GQL
          mutation {
            createDoctor(input: {
              conditionId: #{conditionId}
              name: "#{name}"
              phone: "#{phone}"
              address: "#{address}"
              category: "#{category}"
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
            }
          }
        GQL
      end
    end
  end
end