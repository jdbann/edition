require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  context "GET new" do
    should "respond ok" do
      get new_session_path

      assert_response :ok
    end
  end

  context "POST create" do
    should "render new with invalid params" do
      invalid_params = {session: {email: "john@bannister.com", password: "notmypassword"}}

      post session_path, params: invalid_params

      assert_template "sessions/new"
    end

    should "redirect to root and set session with valid params" do
      valid_params = {session: {email: "john@bannister.com", password: "password"}}

      post session_path, params: valid_params

      assert_redirected_to root_path
      assert_equal session[:current_account_id], accounts(:john).id
    end
  end
end
