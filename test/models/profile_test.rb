require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to(:account)
    should have_rich_text(:description)
    should have_one_attached(:avatar)
  end

  context "validations" do
    should validate_presence_of(:name)
  end
end
