require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  context "GET show" do
    should "require authentication" do
      get person_path(accounts(:fran))

      assert_requires_authentication
    end

    should "respond ok" do
      log_in_as accounts(:john)

      get person_path(accounts(:fran))

      assert_response :ok
    end
  end
end
