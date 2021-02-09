module Authorisation
  extend ActiveSupport::Concern

  included do
    include Pundit

    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index

    alias_method :authorise, :authorize

    def pundit_user
      Current.account
    end
  end
end
