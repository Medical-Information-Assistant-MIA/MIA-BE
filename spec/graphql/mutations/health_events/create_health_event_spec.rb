require "rails_helper"

module Mutations
  module HealthEvents
    RSpec.describe CreateHealthEvent, type: :request do
      describe ".resolve" do
        it "creates a heatlh event" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)

          expect(HealthEvent.count).to eq(0)

          post "/graphql", params: { query: query(conditionId: condition.id, note: "Chronic joint pain", date: "12/7/25", category: "symptom") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(HealthEvent.count).to eq(1)
          expect(response).to be_successful
          expect(data[:data]).to have_key(:createHealthEvent)
          expect(data[:data][:createHealthEvent].keys).to eq(%i[healthEvent errors])
          expect(data[:data][:createHealthEvent][:healthEvent][:id]).to be_a(Integer)
          expect(data[:data][:createHealthEvent][:healthEvent][:note]).to eq("Chronic joint pain")
          expect(data[:data][:createHealthEvent][:healthEvent][:date]).to be_a(String)
          expect(data[:data][:createHealthEvent][:healthEvent][:category]).to eq("symptom")
        end
      end

      describe "error response" do
        it "renders an error if a required field is not provided" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)

          expect(HealthEvent.count).to eq(0)

          post "/graphql", params: { query: query(conditionId: 0, note: "Chronic joint pain", date: "12/7/25", category: "symptom") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:createHealthEvent][:errors]).to eq(["Condition must exist"])
        end
      end

      def query(conditionId:, note:, date:, category:)
        <<~GQL
          mutation {
            createHealthEvent(input: {
              conditionId: #{conditionId}
              note: "#{note}"
              date: "#{date}"
              category: "#{category}"
            }) {
              healthEvent {
              id
              note
              date
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
