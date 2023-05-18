# frozen_string_literal: true

module Types
  class ConditionsType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :created_at, String, null: false
    field :doctors, [Types::DoctorsType], null: false
    field :medications, [Types::MedicationsType], null: false
    field :health_events, [Types::HealthEventsType], null: false

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
