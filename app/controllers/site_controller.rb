class SiteController < ApplicationController
  def index
    redirect_to "/activities/" if user_signed_in?
  end
end