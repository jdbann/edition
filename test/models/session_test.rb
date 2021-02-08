require "test_helper"

class SessionTest < ActiveSupport::TestCase
  context "validations" do
    should validate_presence_of(:email)
    should validate_presence_of(:password)

    should "validate password is correct for email address" do
      invalid_session = Session.new(email: "john@bannister.com", password: "notmypassword")
      refute_predicate invalid_session, :valid?

      valid_session = Session.new(email: "john@bannister.com", password: "password")
      assert_predicate valid_session, :valid?
    end
  end

  context "#account" do
    should "return nil if invalid" do
      invalid_session = Session.new(email: "john@bannister.com", password: "notmypassword")
      assert_nil invalid_session.account
    end

    should "return the appropriate account if valid" do
      valid_session = Session.new(email: "john@bannister.com", password: "password")
      assert_equal valid_session.account, accounts(:john)
    end
  end
end
