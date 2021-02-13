class ProfilesController < ApplicationController
  skip_before_action :ensure_profile_setup

  def new
    @profile = Current.account.build_profile
    authorize @profile
  end

  def create
    @profile = Current.account.build_profile(profile_params)
    authorize @profile

    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :description, :avatar)
  end
end
