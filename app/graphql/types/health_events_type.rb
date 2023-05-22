# frozen_string_literal: true

module Types
  class HealthEventsType < Types::BaseObject
    field :id, Integer, null: false
    field :note, String, null: false
    field :date, String, null: false
    field :category, String, null: true
    field :condition, Types::ConditionsType, null: false
    field :created_at, String, null: false
    field :updated_at, String, null: false

    def created_at
      object.created_at.strftime("%B %d, %Y")
    end

		def updated_at
			object.updated_at.strftime("%B %d, %Y")
		end
  end
end
