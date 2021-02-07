require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  test "creating a message" do
    visit new_message_path

    fill_in_rich_text_area Message.human_attribute_name(:content), with: "A quick test message."
    click_on I18n.t("helpers.submit.message.create")

    assert_text "A quick test message."
  end
end
