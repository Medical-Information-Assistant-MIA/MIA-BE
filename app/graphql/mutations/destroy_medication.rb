module Mutations
  class DestroyMedication < BaseMutation
    argument :id, Integer, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: true

    def resolve(id:)
      medication = Medication.find_by(id:)

      if medication
        if medication.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: medication.errors.full_messages }
        end
      else
        { success: false, errors: ["Medication not found"] }
      end
    end
  end
end