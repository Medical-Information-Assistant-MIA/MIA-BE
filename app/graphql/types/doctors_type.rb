# frozen_string_literal: true

module Types
  class DoctorsType < Types::BaseObject
    field :id, Integer, null: false
    field :conditionId, Integer, null: false
    field :name, String, null: false
    field :address, String, null: true
    field :phone, String, null: true
    field :category, String, null: true
  end
end
