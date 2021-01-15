require 'rails_helper'

RSpec.describe "Surgery Index" do
  it "displays links to all surgeries" do
    create_list(:surgery, 10)

    visit surgeries_path

    Surgery.all.each do |surgery|
      expect(page).to have_link(surgery.title, href: surgery_path(surgery))
    end
  end
end