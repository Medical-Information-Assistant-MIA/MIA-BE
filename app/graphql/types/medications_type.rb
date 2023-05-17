# frozen_string_literal: true

module Types
  class MedicationsType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :pseudonym, String, null: true
    field :date_prescribed, String, null: true
    field :dosage, String, null: true
    field :frequency, String, null: true
    field :as_needed, Boolean, null: true
    field :prescribed_by, String, null: true
		field :condition, Types::ConditionsType, null: false
  end
end
