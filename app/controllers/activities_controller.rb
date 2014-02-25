class ActivitiesController < ApplicationController
  # This class is the controller for activities. Handling index,
  # create, update, and delete.

  # GET - Provide list of activities, in either html or json
  def index
    @activities = Activity.all
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: @activities }
    end
  end

  # POST - create new activity
  def create
    activity_params = params.require(:activity).permit(:title,
                                                       :body,
                                                       tags_attributes:
                                                       [:category_id])

    @activity = Activity.create(activity_params)

    respond_to do |format|
      format.html
      format.json { render json: @activity }
    end
  end

  # GET - provide form to edit an activity
  def edit
    @activity = Activity.find(params[:id])
  end

  # PATCH - save the updated activity attributes
  def update
    updated_activity = params.require(:activity).permit(:title, :body)
    activity = Activity.find(params[:id])
    activity.update_attributes(updated_activity)
    redirect_to activity
  end

  # GET - provide a form to display activity
  def show
    @activity = Activity.find(params[:id])
  end

  # DELETE - delete provided activity
  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to root_url
  end
end
