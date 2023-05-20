require "rails_helper"

module Mutations
  module Conditions
    RSpec.describe UpdateCondition, type: :request do
      describe ".resolve" do
        it "updates a condition" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)

          post "/graphql", params: { query: query(id: condition.id, name: "Advil") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(response).to be_successful
          expect(data[:data]).to have_key(:updateCondition)
          expect(data[:data][:updateCondition][:condition][:name]).to eq("Advil")
          expect(data[:data][:updateCondition][:success]).to be(true)
          expect(data[:data][:updateCondition][:condition][:userId]).to eq(user.id)
        end
      end

      describe "error responses" do
        it "renders an error if a condition id does not exist" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)

          post "/graphql", params: { query: query(id: 333, name: "The hurts") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:updateCondition][:errors]).to eq(["record-not-found"])
          expect(data[:data][:updateCondition][:success]).to eq(false)
        end
      end

      def query(name:, id:)
        <<~GQL
          mutation {
            updateCondition(input: {
              name: "#{name}"
              id: #{id}
            }) {
              condition {
                id
                name
                userId
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
