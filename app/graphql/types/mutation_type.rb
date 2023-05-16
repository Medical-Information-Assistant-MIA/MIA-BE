# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_doctor, mutation: Mutations::CreateDoctor

    def create_doctor(input:)
      doctor = Doctor.create(input.to_h)
      return doctor
    end
  end
end
