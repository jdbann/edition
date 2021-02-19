require "test_helper"

class SessionTest < ActiveSupport::TestCase
  context "validations" do
    should validate_presence_of(:email)
    should validate_presence_of(:password)

    should "flag a generic error if email is not recognised" do
      invalid_session = Session.new(email: "not_an_email", password: "password")
      invalid_session.validate
      assert_includes invalid_session.errors.full_messages, I18n.t("activemodel.errors.messages.email_and_password_not_recognised")
    end

    should "flag a generic error if password is not correct for email address" do
      invalid_session = Session.new(email: "john@bannister.com", password: "notmypassword")
      invalid_session.validate
      assert_includes invalid_session.errors.full_messages, I18n.t("activemodel.errors.messages.email_and_password_not_recognised")
    end

    should "be valid with matching email and password" do
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
