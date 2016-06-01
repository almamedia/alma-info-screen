class PageController < ApplicationController

  def index
    response = FIREBASE.get("/page_config/pages")
    render json: (response.success? ? response.body : "Failed to get current page configuration.")
  end

  def show
    response = FIREBASE.get("/page_config/pages/#{params[:page_id]}")
    render json: (response.success? ? response.body : "Failed to get current page configuration.")
  end

end
