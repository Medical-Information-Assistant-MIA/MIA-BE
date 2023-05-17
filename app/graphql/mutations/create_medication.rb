module Mutations 
  class CreateMedication < BaseMutation 
    argument :name, String, required: true
    argument :conditionId, Integer, required: true
    argument :datePrescribed, String, required: false
    argument :dosage, String, required: false
    argument :frequency, String, required: false
    argument :prescribedBy, String, required: false
    
    field :medication, Types::MedicationsType, null: true
    field :errors, [String], null: true 

    def resolve(name:, conditionId:, date_prescribed:, dosage:, frequency:, prescribed_by:)
      medication = Medication.new(name: name, condition_id: conditionId, datePrescribed: date_prescribed, dosage: dosage, frequency: frequency, prescribed_by: prescribedBy)

      if medication.save
        {
          medication: medication,
          errors: []
        }
      else 
        {
          medication: nil, 
          errors: medication.errors.full_messages
        }
      end
    end
  end
end