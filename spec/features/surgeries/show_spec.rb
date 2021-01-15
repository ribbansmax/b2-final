require 'rails_helper'

RSpec.describe "Surgery Show page" do
  describe "displays" do
    it "attributes" do
      surgery = FactoryBot.create(:surgery)

      visit surgery_path(surgery)

      expect(page).to have_content(surgery.title)
      expect(page).to have_content("Operating Room: ##{surgery.operating_room}")
    end

    xit "other surgeries on this day" do

    end
  end
end