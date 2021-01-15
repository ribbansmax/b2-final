require 'rails_helper'

RSpec.describe "Surgery Show page" do
  describe "displays" do
    it "attributes" do
      surgery = FactoryBot.create(:surgery)

      visit surgery_path(surgery)

      expect(page).to have_content(surgery.title)
      expect(page).to have_content("Operating Room: ##{surgery.operating_room}")
    end

    it "other surgeries on this day" do
      surgery = FactoryBot.create(:surgery, week_day: 3)

      same_day = FactoryBot.create(:surgery, week_day: 3)
      day_before = FactoryBot.create(:surgery, week_day: 2)

      visit surgery_path(surgery)

      within "#other-surgeries" do
        expect(page).to have_content(same_day.title)
        expect(page).not_to have_content(day_before.title)
      end
    end

    it "a way to add a doctor to this surgery" do
      surgery = FactoryBot.create(:surgery)
      hospital = FactoryBot.create(:hospital)
      doctor = FactoryBot.create(:doctor, hospital: hospital)

      visit surgery_path(surgery)

      fill_in("operation[name]", with: doctor.name)
      click_button "Add Doctor"

      expect(page).to have_content(doctor.name)
    end
  end
end