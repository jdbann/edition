require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest
  context "GET index" do
    should "require authentication" do
      get entries_path

      assert_requires_authentication
    end

    should "respond ok" do
      log_in_as accounts(:john)

      get entries_path

      assert_response :ok
    end
  end

  context "GET show" do
    should "require authentication" do
      get entry_path(entries(:first))

      assert_requires_authentication
    end

    should "respond ok" do
      log_in_as accounts(:john)

      get entry_path(entries(:first))

      assert_response :ok
    end
  end

  context "DELETE destroy" do
    should "require authentication" do
      delete entry_path(entries(:first))

      assert_requires_authentication
    end

    should "redirect to index" do
      log_in_as accounts(:john)

      assert_changes -> { Entry.count } do
        delete entry_path(entries(:first))
      end

      assert_redirected_to entries_path
    end
  end
end
