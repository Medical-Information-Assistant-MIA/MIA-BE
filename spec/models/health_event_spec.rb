# frozen_string_literal: true

require "rails_helper"

RSpec.describe HealthEvent, type: :model do
  describe "validations" do
    it { should validate_presence_of :note }
    it { should validate_presence_of :date }
    it { should validate_presence_of :type }
  end

  describe "relationships" do
    it { should belong_to :condition }
  end
end
