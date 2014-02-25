class CategoriesController < ApplicationController
  # This class is the controller for categories. Handling index,
  # create, update, and delete.

  # AUTHORIZATION - make sure a user is logged in, when accessing this page
  before_filter :authenticate_user!

  # GET - Provide list of categories, in either html or json
  def index
    data = []
    curr_user = current_user
    categories = curr_user.categories.uniq
    categories.each do |category|
      d1 = {}
      d1['name'] = category.name
      d1['activity_count'] = category.activities.where(user_id: curr_user.id).count
      content_count = 0
      category.activities.where(user_id: curr_user.id).each do |a|
        content_count += a.contents.count
      end
      d1['content_count'] = content_count
      data << d1
    end

    missing_categories = Category.all.map { |c| c.name } - data.map{ |d| d['name'] }
    missing_categories.each do |mc|
      data << {
        name: mc,
        activity_count: 0,
        content_count: 0
      }
    end

    respond_to do |format|
      format.json { render json: data }
    end
  end
end
