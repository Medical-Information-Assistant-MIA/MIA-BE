# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_doctor, mutation: Mutations::CreateDoctor
    field :create_medication, mutation: Mutations::CreateMedication
    field :create_condition, mutation: Mutations::CreateCondition
    field :create_health_event, mutation: Mutations::CreateHealthEvent

    field :update_medication, mutation: Mutations::UpdateMedication
		field :update_user, mutation: Mutations::UpdateUser
  end
end
