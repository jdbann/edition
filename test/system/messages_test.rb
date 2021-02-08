require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  test "creating a message" do
    log_in_as accounts(:john)
    visit messages_path

    click_on I18n.t("messages.index.new_link")
    fill_in_rich_text_area Message.human_attribute_name(:content), with: "A quick test message."
    click_on I18n.t("helpers.submit.message.create")

    assert_text "A quick test message."
  end

  test "editing a message" do
    log_in_as accounts(:john)
    message = messages(:first)

    visit message_path(message)
    click_on I18n.t("messages.message.edit_link")
    fill_in_rich_text_area Message.human_attribute_name(:content), with: "An updated message."
    click_on I18n.t("helpers.submit.message.update")

    assert_text "An updated message."
  end

  test "deleting a message" do
    log_in_as accounts(:john)
    message = messages(:first)
    message_content = message.content.to_plain_text

    visit message_path(message)
    click_on I18n.t("messages.message.delete_button")

    refute_text message_content
  end
end
