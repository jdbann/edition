require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  test "creating a message" do
    log_in_as accounts(:john)
    visit entries_path

    click_on I18n.t("entries.index.new_message_link")
    fill_in_rich_text_area Message.human_attribute_name(:content), with: "A quick test message."
    click_on I18n.t("helpers.submit.message.create")

    assert_text "A quick test message."
  end

  test "editing a message" do
    log_in_as accounts(:john)
    message = messages(:first)

    visit entry_path(message.entry)
    click_on I18n.t("entries.entry.edit_link")
    fill_in_rich_text_area Message.human_attribute_name(:content), with: "An updated message."
    click_on I18n.t("helpers.submit.message.update")

    assert_text "An updated message."
  end

  test "deleting a message" do
    log_in_as accounts(:john)
    message = messages(:first)
    message_content = message.content.to_plain_text

    visit entry_path(message.entry)
    click_on I18n.t("entries.entry.delete_button")

    refute_text message_content
  end
end
