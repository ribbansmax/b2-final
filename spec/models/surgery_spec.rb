require "rails_helper"

describe Surgery, type: :model do

  describe "relations" do
    it {should have_many :operations}
    it {should have_many(:doctors).through(:operations)}
  end
end