module Mutations
  class UpdateDoctor < BaseMutation
    argument :id, Integer, required: true
    argument :name, String, required: false
    argument :conditionId, Integer, required: false
    argument :address, String, required: false
    argument :phone, String, required: false
    argument :category, String, required: false

    field :doctor, Types::DoctorsType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true

    def resolve(id:, **args)
      doctor = Doctor.find(id)

      if doctor.update(args)
        { success: true, doctor: doctor, errors: [] }
      end
    rescue ActiveRecord::RecordNotFound
      { success: false, doctor: nil, errors: ["record-not-found"] }
    end
  end
end
