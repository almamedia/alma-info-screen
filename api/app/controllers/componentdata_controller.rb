class ComponentdataController < ApplicationController

  def index
  end

  def show
  end

  def create
    component_data_list = FIREBASE.get("/component_data").body
    component_data_list.keys.map { |component_data_entry|
      if component_data_list[component_data_entry]["name"] == params[:name]
        render json: "Failed to push new component data. Component data for this component already exists!", status: :bad_request
        return
      end
    }
    component_data = {
      name: params[:name],
      data: params[:data]
    }
    response = FIREBASE.push("/component_data", component_data)
    render json: (response.success? ? response.body : "Failed to push new component data."), status: (response.success? ? :ok : :bad_request)
  end

  def update
  end


end
