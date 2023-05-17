module Mutations 
  class CreateMedication < BaseMutation 

    argument :conditionId, Integer, required: true
    argument :name, String, required: true
    argument :datePrescribed, String, required: false
    argument :dosage, String, required: false
    argument :frequency, String, required: false
    argument :prescribedBy, String, required: false
    
    field :medication, Types::MedicationsType, null: true
    field :errors, [String], null: true 

    def resolve(conditionId:, name:, datePrescribed:, dosage:, frequency:, prescribedBy:)
      medication = Medication.new(condition_id: conditionId, name: name, date_prescribed: datePrescribed, dosage: dosage, frequency: frequency, prescribed_by: prescribedBy)

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