require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  test "creating an account" do
    visit root_path

    click_on I18n.t("layouts.application.new_account_link")
    fill_in Account.human_attribute_name(:email), with: "adam@bannister.com"
    fill_in Account.human_attribute_name(:password), with: "password"
    click_on I18n.t("helpers.submit.account.create")

    assert_text "adam@bannister.com"
  end
end
