# frozen_string_literal: true

module Types
  class HealthEventsType < Types::BaseObject
    field :id, Integer, null: false
    field :note, String, null: false
    field :date, String, null: false
    field :category, String, null: true
    field :condition, Types::ConditionsType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
