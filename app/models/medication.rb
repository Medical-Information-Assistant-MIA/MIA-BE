# frozen_string_literal: true

class Medication < ApplicationRecord
  belongs_to :condition

  validates :name, presence: true
end
