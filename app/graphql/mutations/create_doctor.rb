module Mutations
  class CreateDoctor < BaseMutation
    argument :conditionId, Integer, required: true
    argument :name, String, required: true
    argument :address, String, required: false
    argument :phone, String, required: false
    argument :category, String, required: false

    field :doctor, Types::DoctorsType, null: true
    field :errors, String, null: true

    def resolve(conditionId:, name:, address:, phone:, category:)
      doctor = Doctor.new(conditionId: conditionId, name: name, address: address, phone: phone, category: category)

      if doctor.save
        {
          doctor: doctor,
          errors: []
        }
      else
        {
          doctor: nil,
          errors: doctor.errors.full_messages
        }
      end
    end
  end
end