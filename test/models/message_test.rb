require "test_helper"

class MessageTest < ActiveSupport::TestCase
  context "associations" do
    should have_rich_text(:content)
    should have_one(:entry)
  end

  context "validations" do
    should validate_presence_of(:content)
  end
end
