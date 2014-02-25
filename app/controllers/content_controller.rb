# All the usual methods for content.
# Using 'contents' as a plural for content because
# I didn't think through that model name.
class ContentController < ApplicationController
  def index
    @contents = Activity.find(activity_id).contents
    respond_to do |f|
      f.html
      f.json { render json: { contents: @contents } }
    end
  end

  def show
    @content = Activity.find(activity_id).contents.find(id)
    respond_to do |f|
      f.html
      f.json { render json: { content: @content } }
    end
  end

  def create
    content = Activity.find(activity_id).contents.create(content_params)
    respond_to do |f|
      f.json { render json: { content: content } }
    end

  end

  def update
    content = Activiy.find(activity_id).contents.find(id)
    content.update_attributes(content_params)
    respond_to do |f|
      f.html redirect_to activity_content_path(activity_id, id)
      f.json { render json: { content: content } }
    end
  end

  def destroy
    Activity.find(activity_id).contents.find(id).destroy
    respond_to do |f|
      f.html redirect_to activity_content_index activity_id
      f.json { render json: {} }
    end
  end

  def add_pic
    Activity.find(activity_id).contents.create(body: params['url'], kind:'image')
    render json:  {url: "/activities/#{activity_id}"}
  end

  private

  def activity_id
    params[:activity_id]
  end

  def id
    params[:id]
  end

  def content_params
    params.require(:content).permit(:title, :body)
  end
end
