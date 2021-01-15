require 'rails_helper'

RSpec.describe "Hospitals Surgery Index" do
  xit "displays all surgeries by operating room" do
    hospital = FactoryBot.create(:hospital)
    surgery = FactoryBot.create(:surgery)
    doctor = FactoryBot.create(:doctor, hospital: hospital)
    operation = Operation.create(doctor: doctor, surgery: surgery)

    visit hospital_surgeries_path(hospital)

    expect(page).to have_content(surgery.title)
  end
end