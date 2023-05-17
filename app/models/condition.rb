# frozen_string_literal: true

class Condition < ApplicationRecord
  belongs_to :user
	has_many :doctors
	has_many :medications
	has_many :health_events

  validates :name, presence: true
end
