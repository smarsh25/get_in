class ProfilesController < ApplicationController

  def create
    profile_params = params.require(:profile).permit(:first_name, :last_name, :school, :expected_graduation, :city, :state)
    @profile = Profile.create(profile_params)
    respond_to do |format|
      format.html
      format.json { render json: @profile }
    end
  end

  def edit
    @profile = Profile.find(id)
  end

  def update
    updated_profile = params.require(:profile).permit(:first_name, :last_name, :school, :expected_graduation, :city, :state)
    profile = Profile.find(id)
    profile.update_attributes(updated_profile)
    redirect_to profile_path
  end


   def destroy
    Profile.find(id).destroy
    respond_to do |f|
      f.html redirect_to user_profile_path
      f.json { render json: {} }
    end
  end

  def show
    @profile = Profile.find(id)
    respond_to do |f|
      f.html
      f.json { render json: { content: @profile } }
    end
  end

private 
  #simplifying how we call ids

  def id 
    params[:id]
  end



end
