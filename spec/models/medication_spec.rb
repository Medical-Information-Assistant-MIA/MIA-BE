require "rails_helper"

RSpec.describe Medication, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :date_prescribed }
  end

  describe "relationships" do
    it { should belong_to :condition }
  end
end
