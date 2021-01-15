require 'rails_helper'

RSpec.describe "Surgery Index" do
  it "displays links to all surgeries" do
    create_list(:surgery, 10)

    visit surgeries_path

    Surgery.all.each do |surgery|
      expect(page).to have_link(surgery.title, href: surgery_path(surgery))
    end
  end

  it "displays all of a surgery's doctors" do
    create_list(:surgery, 10)
    hospital = FactoryBot.create(:hospital)

    Surgery.all.each do |surgery|
      doctor = FactoryBot.create(:doctor, hospital: hospital)
      Operation.create(doctor: doctor, surgery: surgery)
    end

    visit surgeries_path

    Surgery.all.each do |surgery|
      within("#surgery-#{surgery.id}") do
        expect(page).to have_content(surgery.doctors.first.name)
      end
    end
  end
end