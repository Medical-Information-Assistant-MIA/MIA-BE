class Medication < ApplicationRecord
  belongs_to :condition

  validates :name, :date_prescribed, presence: true
end