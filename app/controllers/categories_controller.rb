class CategoriesController < ApplicationController
  # This class is the controller for categories. Handling index,
  # create, update, and delete.

  # GET - Provide list of categories, in either html or json
  def index
    data = []
    # this code needs to be changed to show only the correct pofile data
    # categories = current_user.categories
    categories = Category.all
    categories.each do |category|
      d1 = {}
      d1['name'] = category.name
      d1['activity_count'] = category.activities.count
      content_count = 0
      category.activities.each do |a|
        content_count += a.contents.count
      end
      d1['content_count'] = content_count
      data << d1
    end
    

    respond_to do |format|
      format.json { render json: data }  
    end 
  end


end