require "rails_helper"

module Mutations
  module HealthEvents
    RSpec.describe UpdateHealthEvent, type: :request do
      describe ".resolve" do
        it "updates a health event" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          health_event = create(:health_event, condition_id: condition.id, category: "doctor_visit")
          expect(HealthEvent.count).to eq(1)

          post "/graphql", params: { query: query(id: health_event.id, category: "symptom") }
          data = JSON.parse(response.body, symbolize_names: true)
          expect(response).to be_successful
          expect(data[:data][:updateHealthEvent][:success]).to eq(true)
          expect(data[:data][:updateHealthEvent].keys).to eq(%i[healthEvent errors success])
          expect(data[:data][:updateHealthEvent][:healthEvent][:id]).to eq(health_event.id)
          expect(data[:data][:updateHealthEvent][:healthEvent][:note]).to be_a(String)
          expect(data[:data][:updateHealthEvent][:healthEvent][:date]).to be_a(String)
          expect(data[:data][:updateHealthEvent][:healthEvent][:category]).to eq("symptom")
        end
      end

      describe "error responses" do
        it "renders an error if a health event id does not exist" do
          user = create(:user)
          condition = create(:condition, user_id: user.id)
          health_event = create(:health_event, category: "doctor_visit")
          expect(HealthEvent.count).to eq(1)

          post "/graphql", params: { query: query(id: 333, category: "symptom") }
          data = JSON.parse(response.body, symbolize_names: true)

          expect(data[:data][:updateHealthEvent][:errors]).to eq(["Health Event not found"])
          expect(data[:data][:updateHealthEvent][:success]).to eq(false)
          expect(HealthEvent.count).to eq(1)
        end
      end

      def query(id:, category:)
        <<~GQL
          mutation {
            updateHealthEvent(input: {
              category: "#{category}"
              id: #{id}
            }) 
            {
              healthEvent {
                id
                note
                date
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
