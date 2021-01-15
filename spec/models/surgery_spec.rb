require "rails_helper"

describe Surgery, type: :model do

  describe "relations" do
    it {should have_many :operations}
    it {should have_many(:doctors).through(:operations)}
  end

  describe "class methods" do
    it "Can organize by operating room" do
      surgery = FactoryBot.create(:surgery, operating_room: 3)
      surgery2 = FactoryBot.create(:surgery, operating_room: 3)
      surgery3 = FactoryBot.create(:surgery, operating_room: 4)

      expect(Surgery.all.by_operating_room[3]).to eq([surgery.title, surgery2.title])
    end
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