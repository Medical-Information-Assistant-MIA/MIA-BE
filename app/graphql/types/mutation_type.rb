# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_doctor, mutation: Mutations::CreateDoctor
		field :create_condition, mutation: Mutations::CreateCondition
    field :test_field, String, null: false, description: "An example field added by the generator"
    field :create_health_event, mutation: Mutations::CreateHealthEvent

    def test_field
      "Hello World"
    end
  end
end
