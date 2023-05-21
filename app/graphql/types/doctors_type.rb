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
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
