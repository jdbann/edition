class PeopleController < ApplicationController
  def show
    @account = Account.find(params[:id])
    authorise @account
  end
end
