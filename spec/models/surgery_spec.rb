require "rails_helper"

describe Surgery, type: :model do

  describe "relations" do
    it {should have_many :operations}
    it {should have_many(:doctors).through(:operations)}
  end

  describe "instance methods" do
    it "can provide same day surgeries" do
      surgery = FactoryBot.create(:surgery, week_day: 3)

      same_days = FactoryBot.create_list(:surgery, 4, week_day: 3)
      day_before = FactoryBot.create(:surgery, week_day: 2)

      expect(surgery.same_day_surgeries.to_set).to eq(same_days.to_set)
    end
  end
end