# frozen_string_literal: true

class HealthEvent < ApplicationRecord
  belongs_to :condition

  validates :note, :date, :category, presence: true

  enum :category, { symptom: 0, doctor_visit: 1, general_note: 2 }
end
