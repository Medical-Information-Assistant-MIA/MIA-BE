class HealthEvent < ApplicationRecord
  belongs_to :condition

  validates :note, :date, :type, presence: true

  # enum type: { type_1: 0, type_2: 1 } (need to define what types)
end
