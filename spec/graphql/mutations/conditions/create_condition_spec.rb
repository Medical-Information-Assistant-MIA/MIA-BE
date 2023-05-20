require "rails_helper"

module Mutations
  module Conditions
    RSpec.describe CreateCondition, type: :request do
      describe ".resolve" do
        it "creates a condition" do
          user = create(:user)

          expect(Condition.count).to eq(0)

          post "/graphql", params: { query: query(userId: user.id, name: "Anemia") }

          data = JSON.parse(response.body, symbolize_names: true)

          expect(Condition.count).to eq(1)
          expect(response).to be_successful
          expect(data[:data][:createCondition][:condition][:id]).to be_a(Integer)
          expect(data[:data][:createCondition][:condition][:name]).to eq("Anemia")
        end

        it "shows an error if the user doesn't exist" do
          user = create(:user)

          expect(Condition.count).to eq(0)

          post "/graphql", params: { query: query(userId: 5, name: "Anemia") }

          data = JSON.parse(response.body, symbolize_names: true)

          expect(Condition.count).to eq(0)
          expect(response).to be_successful
          expect(data[:data][:createCondition][:condition]).to eq(nil)
          expect(data[:data][:createCondition][:errors]).to eq(["User must exist"])
        end

        it "shows and error if the condition name is not entered" do
          user = create(:user)

          expect(Condition.count).to eq(0)

          post "/graphql", params: { query: query(userId: user.id, name: "") }

          data = JSON.parse(response.body, symbolize_names: true)

          expect(Condition.count).to eq(0)
          expect(response).to be_successful
          expect(data[:data][:createCondition][:condition]).to eq(nil)
          expect(data[:data][:createCondition][:errors]).to eq(["Name can't be blank"])
        end
      end

      def query(userId:, name:)
        <<~GQL
          mutation {
            createCondition(input: {
              name: "#{name}"
              userId: #{userId}
            }) {
              condition {
              id
              name
              }
              errors
            }
          }
        GQL
      end
    end
  end
end
