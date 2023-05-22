# frozen_string_literal: true

module Types
  class UsersType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :conditions, [Types::ConditionsType], null: true
    field :created_at, String, null: false
    field :updated_at, String, null: false
    
  end
end
