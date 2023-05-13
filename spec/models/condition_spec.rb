require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { belong_to :user }
  end
end