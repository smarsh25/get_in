# manages profile editing
class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find(1)
  end

  def update
    updated_profile = params.require(:profile).permit(:first_name, :last_name, :school, :expected_graduation, :city, :state)
    profile = Profile.find(id)
    profile.update_attributes(updated_profile)
    redirect_to profile_path
  end

  def show
    @profile = Profile.find(1)
    respond_to do |f|
      f.html
      f.json { render json: { content: @profile } }
    end
  end

  private

  # simplifying how we get id
  def id
    params[:id]
  end
end
