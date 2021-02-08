module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :setup_authentication
    before_action :authenticate
  end

  private

  def setup_authentication
    Current.account = Account.find_by(id: session[:current_account_id])

    if Current.account.blank?
      clear_current_account
    end
  end

  def authenticate
    redirect_to new_session_path unless Current.account.present?
  end

  def set_current_account(account)
    Current.account = account
    session[:current_account_id] = account.id
  end

  def clear_current_account
    session[:current_account_id] = nil
  end
end
