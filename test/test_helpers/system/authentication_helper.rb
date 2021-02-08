module System
  module AuthenticationHelper
    def log_in_as(account, password = "password")
      visit new_session_path
      fill_in Session.human_attribute_name(:email), with: account.email
      fill_in Session.human_attribute_name(:password), with: password
      click_button I18n.t("helpers.submit.session.create")
      assert_text account.email
    end
  end
end
