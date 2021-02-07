require "test_helper"

class MessageTest < ActiveSupport::TestCase
  context "associations" do
    should have_rich_text(:content)
  end

  context "validations" do
    should validate_presence_of(:content)
  end
end
