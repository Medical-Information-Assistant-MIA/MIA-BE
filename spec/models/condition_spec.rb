# frozen_string_literal: true

require "rails_helper"

RSpec.describe Condition, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should belong_to :user }
    it { should have_many :doctors }
    it { should have_many :health_events }
    it { should have_many :medications }
  end
end
