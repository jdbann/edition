module AuthenticationHelper
  def assert_requires_authentication
    assert_redirected_to new_session_path
  end

  def log_in_as(account, password = "password")
    post session_path, params: {session: {email: account.email, password: password}}
  end
end
