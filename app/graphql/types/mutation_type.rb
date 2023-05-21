# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_condition, mutation: Mutations::CreateCondition
    field :create_doctor, mutation: Mutations::CreateDoctor
    field :create_medication, mutation: Mutations::CreateMedication
    field :create_health_event, mutation: Mutations::CreateHealthEvent

    field :update_user, mutation: Mutations::UpdateUser
    field :update_condition, mutation: Mutations::UpdateCondition
    field :update_doctor, mutation: Mutations::UpdateDoctor
    field :update_medication, mutation: Mutations::UpdateMedication

    field :destroy_user, mutation: Mutations::DestroyUser
    field :destroy_condition, mutation: Mutations::DestroyCondition
    field :destroy_doctor, mutation: Mutations::DestroyDoctor
  end
end
