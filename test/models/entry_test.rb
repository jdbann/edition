require "test_helper"

class EntryTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to(:account)
    should belong_to(:entryable).dependent(:destroy)
  end
end
