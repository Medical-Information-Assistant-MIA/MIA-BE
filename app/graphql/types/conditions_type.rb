# frozen_string_literal: true

module Types
  class ConditionsType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :created_at, String, null: false

    def created_at
      object.created_at.strftime("%B %d, %Y")
    end
  end
end
