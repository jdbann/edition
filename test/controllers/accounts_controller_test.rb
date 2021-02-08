require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  context "GET new" do
    should "respond ok" do
      get new_account_path

      assert_response :ok
    end
  end

  context "POST create" do
    should "render new with invalid params" do
      invalid_params = {account: {email: "", password: "password"}}

      post account_path, params: invalid_params

      assert_template "accounts/new"
    end

    should "redirect to root and set session with valid params" do
      valid_params = {account: {email: "adam@bannister.com", password: "password"}}

      assert_changes -> { Account.count } do
        post account_path, params: valid_params
      end

      assert_redirected_to root_path
      assert_equal session[:current_account_id], Account.last.id
    end
  end
end
