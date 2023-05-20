# frozen_string_literal: true

module Types
  class ConditionsType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :created_at, String, null: false
    field :doctors, [Types::DoctorsType], null: false
    field :medications, [Types::MedicationsType], null: false
    field :health_events, [Types::HealthEventsType], null: false
    # Added because RSpec testing was not able to find this field for returning the condition, but get condition was confirmed working with FE
    field :user_id, Integer, null: false

    def doctors
      object.doctors
    end

    def medications
      object.medications
    end

    def health_events
      object.health_events
    end

    def created_at
      object.created_at.strftime("%B %d, %Y")
    end
  end
end
