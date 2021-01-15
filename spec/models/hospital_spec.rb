require "rails_helper"

describe Hospital, type: :model do

  describe "relations" do
    it {should have_many :doctors}
    it {should have_many(:surgeries).through(:doctors)}
  end
end