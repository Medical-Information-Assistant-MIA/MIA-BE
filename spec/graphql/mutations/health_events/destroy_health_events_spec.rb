require "rails_helper"

module Mutations
  module HealthEvents
    RSpec.describe DestroyHealthEvent, type: :request do
      describe ".resolve" do
        it "destroys a health event" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          health_event = create(:health_event, condition_id: condition.id, category: 2)
          expect(HealthEvent.count).to eq(1)

          post "/graphql", params: { query: query(id: health_event.id) }
          data = JSON.parse(response.body, symbolize_names: true)
          
          expect(response).to be_successful
          expect(data[:data][:destroyHealthEvent][:success]).to eq(true)
          expect(HealthEvent.count).to eq(0)
        end
      end

      describe "error responses" do
        it "renders an error if a health event id does not exist" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          health_event = create(:health_event, condition_id: condition.id)
          expect(HealthEvent.count).to eq(1)

          post "/graphql", params: { query: query(id: 333) }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:destroyHealthEvent][:errors]).to eq(["HealthEvent not found"])
          expect(data[:data][:destroyHealthEvent][:success]).to eq(false)
          expect(HealthEvent.count).to eq(1)
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            destroyHealthEvent(input: {
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
