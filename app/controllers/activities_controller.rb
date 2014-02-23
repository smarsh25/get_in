class ActivitiesController < ApplicationController
  # This class is the controller for activities. Handling index,
  # create, update, and delete.

  # Provide list of activities, in either html or json
  def index
    @activities = Activity.all
    respond_to do |format|
      format.html
      format.json { render json: @activities }
    end
  end

  def create
    activity_params = params.require(:activity).permit(:title, :body)
    @activity = Activity.create(activity_params)

    respond_to do |format|
      format.html
      format.json { render json: @activity }
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to root_url
  end
end
