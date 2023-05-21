require "rails_helper"

module Mutations
  module Conditions
    RSpec.describe DestroyCondition, type: :request do
      describe ".resolve" do
        it "destroys a condition" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          expect(Condition.count).to eq(1)

          post "/graphql", params: { query: query(id: condition.id) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(response).to be_successful
          expect(data[:data][:destroyCondition][:success]).to eq(true)
          expect(Condition.count).to eq(0)
        end
      end

      describe "error responses" do
        it "renders an error if a condition id does not exist" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          expect(Condition.count).to eq(1)

          post "/graphql", params: { query: query(id: 333) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:destroyCondition][:errors]).to eq(["Condition not found"])
          expect(data[:data][:destroyCondition][:success]).to eq(false)
          expect(Condition.count).to eq(1)
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            destroyCondition(input: {
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
