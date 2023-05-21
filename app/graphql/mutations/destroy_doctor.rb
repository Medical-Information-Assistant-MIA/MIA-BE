module Mutations
  class DestroyDoctor < BaseMutation
    argument :id, Integer, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      doctor = Doctor.find_by(id:)

      if doctor
        if doctor.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: doctor.errors.full_messages }
        end
      else
        { success: false, errors: ["Doctor not found"] }
      end
    end
  end
end