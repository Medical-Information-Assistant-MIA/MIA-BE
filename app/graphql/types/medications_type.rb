# frozen_string_literal: true

module Types
  class MedicationsType < Types::BaseObject
    field :id, Integer, null: false
    field :name, String, null: false
    field :date_prescribed, String, null: true
    field :dosage, String, null: true
    field :frequency, String, null: true
    field :prescribed_by, String, null: true
  end
end
