class ComponentController < ApplicationController
  
  def create
    page_component = [
      {
        name: params[:name],
        width: params[:width],
        height: params[:height],
        position_x: 1,
        position_y: 1,
        float: params[:float]
      }
    ]
    response = FIREBASE.push("page_config/pages/#{params[:page_id]}", page_component)
    render json: (response.success? ? response.body : "Failed to push new component.")
  end

  def update
    page_component = {
      name: params[:name],
      width: params[:width],
      height: params[:height],
      position_x: 1,
      position_y: 1,
      float: params[:float]
    }
    response = FIREBASE.update("page_config/pages/#{params[:page_id]}/#{params[:component_id]}", page_component)
    render json: (response.success? ? response.body : "Failed to push new component.")
  end


end
