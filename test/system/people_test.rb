require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  test "viewing a person" do
    log_in_as accounts(:john)

    visit person_path(accounts(:fran))

    assert_text profiles(:fran).name
  end
end
