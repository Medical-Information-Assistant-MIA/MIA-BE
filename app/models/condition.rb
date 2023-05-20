# frozen_string_literal: true

class Condition < ApplicationRecord
  belongs_to :user
  has_many :doctors, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :health_events, dependent: :destroy

  validates :name, presence: true
end
