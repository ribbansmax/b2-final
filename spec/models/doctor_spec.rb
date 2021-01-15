require "rails_helper"

describe Doctor, type: :model do

  describe "relations" do
    it {should have_many :operations}
    it {should belong_to :hospital}
    it {should have_many(:surgeries).through(:operations)}
  end
end