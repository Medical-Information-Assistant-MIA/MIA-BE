# frozen_string_literal: true

class User < ApplicationRecord
  has_many :conditions, dependent: :destroy
  has_many :doctors, through: :conditions, dependent: :destroy
  has_many :medications, through: :conditions, dependent: :destroy
  has_many :health_events, through: :conditions, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
