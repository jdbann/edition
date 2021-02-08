class ApplicationController < ActionController::Base
  private

  def current_account
    return @current_account if defined?(@current_account)

    @current_account = Account.find_by(id: session[:current_account_id])
  end
  helper_method :current_account
end
