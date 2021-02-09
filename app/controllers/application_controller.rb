class ApplicationController < ActionController::Base
  include Authentication
  include Authorisation
end
