require "test_helper"

class AccountTest < ActiveSupport::TestCase
  context "associations" do
    should have_many(:entries)
    should have_one(:profile)
    should have_secure_password
  end

  context "validations" do
    should validate_presence_of(:email)
    should validate_uniqueness_of(:email).case_insensitive
  end
end
