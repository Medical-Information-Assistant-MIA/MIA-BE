# frozen_string_literal: true

class User < ApplicationRecord
  has_many :conditions
	has_many :doctors, through: :conditions
	has_many :medications, through: :conditions
	has_many :health_events, through: :conditions

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
