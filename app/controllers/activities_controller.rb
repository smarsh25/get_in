class ActivitiesController < ApplicationController
  # This class is the controller for activities. Handling index,
  # create, update, and delete.

  # Provide list of activities, in either html or json
  def index
    @activities = Activity.all
    respond_to do |format|
      format.html
      format.json { render :json => @activities }
    end
  end
end
