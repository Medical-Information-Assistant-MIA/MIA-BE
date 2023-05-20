module Mutations
  class UpdateMedication < BaseMutation
    argument :id, Integer, required: true
    argument :conditionId, Integer, required: false
    argument :name, String, required: false
    argument :datePrescribed, String, required: false
    argument :dosage, String, required: false
    argument :frequency, String, required: false
    argument :prescribedBy, String, required: false

    field :medication, Types::MedicationsType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true

    def resolve(id:, **args)
      medication = Medication.find(id)

      if medication.update(args)
        { success: true, medication:, errors: [] }
      else
        { success: false, medication: nil, errors: medication.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound
      { success: false, medication: nil, errors: ["record-not-found"] }
    end
  end
end
