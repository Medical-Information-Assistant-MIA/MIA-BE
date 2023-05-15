require "rails_helper"

RSpec.describe "Factory Bot Test" do 
  describe "test that factories return what they are supposed to" do 
    it "has users, conditions, health events, doctors and medications" do 
      user_1 = create(:user)
      user_2 = user_with_three_conditions
      condition = create(:condition, user: user_1)
      h_e = create(:health_event, condition: condition, type: 0)
      doctor = create(:doctor, condition: condition)
      medication = create(:medication, condition: condition, prescribed_by: doctor.name)
    end
  end
end