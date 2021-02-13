class ApplicationController < ActionController::Base
  include Authentication
  include Authorisation

  before_action :ensure_profile_setup

  private

  def ensure_profile_setup
    return if Current.account.blank? || Current.account.profile.present?

    redirect_to new_profile_path
  end
end
