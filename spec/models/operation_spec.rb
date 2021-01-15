require "rails_helper"

describe Operation, type: :model do

  describe "relations" do
    it {should belong_to :doctor}
    it {should belong_to :surgery}
  end
end