class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      session[:current_account_id] = @account.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def account_params
    params.require(:account).permit(:email, :password)
  end
end
