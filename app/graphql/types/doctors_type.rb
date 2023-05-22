# frozen_string_literal: true

module Types
  class DoctorsType < Types::BaseObject
    field :id, Integer, null: false
    field :condition_id, Integer, null: false
    field :name, String
    field :phone, String
    field :category, String
    field :address, String
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
