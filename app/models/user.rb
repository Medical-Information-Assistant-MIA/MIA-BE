# frozen_string_literal: true

class User < ApplicationRecord
  has_many :conditions

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
