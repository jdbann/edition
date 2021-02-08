class AccountsController < ApplicationController
  skip_before_action :authenticate

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      set_current_account(@account)
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