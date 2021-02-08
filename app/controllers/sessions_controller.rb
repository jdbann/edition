class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    if @session.valid?
      set_current_account(@session.account)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
