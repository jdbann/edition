require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "creating a new session" do
    visit root_path

    click_on I18n.t("layouts.application.new_session_link")
    fill_in Session.human_attribute_name(:email), with: "john@bannister.com"
    fill_in Session.human_attribute_name(:password), with: "password"
    click_button I18n.t("helpers.submit.session.create")

    assert_text "john@bannister.com"
  end
end
