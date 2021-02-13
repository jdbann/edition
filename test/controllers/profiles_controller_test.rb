require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  context "GET new" do
    should "respond ok" do
      log_in_as accounts(:without_profile)

      get new_profile_path

      assert_response :ok
    end
  end

  context "POST create" do
    should "render new with invalid params" do
      invalid_params = {profile: {name: ""}}
      log_in_as accounts(:without_profile)

      post profile_path, params: invalid_params

      assert_template "profiles/new"
    end

    should "redirect to root with valid params" do
      account = accounts(:without_profile)
      valid_params = {profile: {name: "Aglad Honk"}}
      log_in_as account

      assert_changes -> { account.reload.profile.present? } do
        post profile_path, params: valid_params
      end

      assert_redirected_to root_path
    end
  end
end
