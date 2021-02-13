require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  test "requires you to setup a profile" do
    log_in_as accounts(:without_profile)
    visit root_path

    assert_text I18n.t("profiles.new.title")
  end

  test "allows setting up a profile" do
    log_in_as accounts(:without_profile)
    visit new_profile_path

    fill_in Profile.human_attribute_name(:name), with: "Aglad Honk"
    fill_in_rich_text_area Profile.human_attribute_name(:description), with: "HONK!"
    attach_file Profile.human_attribute_name(:avatar), file_fixture("avatar.jpg")
    click_on I18n.t("helpers.submit.profile.create")

    assert_text "Aglad Honk"
  end
end
