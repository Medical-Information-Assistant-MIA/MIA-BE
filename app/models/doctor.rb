# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :condition

  validates :name, presence: true
end
