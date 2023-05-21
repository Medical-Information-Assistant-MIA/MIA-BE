module Mutations
  class CreateDoctor < BaseMutation
    argument :name, String, required: true
    argument :conditionId, Integer, required: true
    argument :address, String, required: false
    argument :phone, String, required: false
    argument :category, String, required: false

    field :doctor, Types::DoctorsType, null: true
    field :errors, [String], null: true

    def resolve(name:, conditionId:, address:, phone:, category:)
      doctor = Doctor.new(name: name, condition_id: conditionId, address: address, phone: phone, category: category)
      condition = Condition.find(conditionId)

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
