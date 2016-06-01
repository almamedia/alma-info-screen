class ComponentdataController < ApplicationController

  # curl -X GET localhost:3000/componentdata
  def index
    response = FIREBASE.get("/component_data").body
    render json: (!response.nil? ? response : "Failed to get component data."), status: (!response.nil? ? :ok : :bad_request)
  end

  # curl -X GET localhost:3000/componentdata/SlackMessage
  def show
    component_data_list = FIREBASE.get("/component_data").body
    if !component_data_list.nil?
      component_data_list.keys.map { |component_data_entry|
        if component_data_list[component_data_entry]["name"] == params[:id]
          render json: component_data_list[component_data_entry]
          return
        end
      }
    end
    render json: "Failed to get component data.", status: :bad_request
  end

  # curl -X POST -d "name=SlackMessage" -d 'data={"current_message": "testi viesti"}' localhost:3000/componentdata
  def create
    component_data_list = FIREBASE.get("/component_data").body
    if !component_data_list.nil?
      component_data_list.keys.map { |component_data_entry|
        if component_data_list[component_data_entry]["name"] == params[:name]
          render json: "Failed to push new component data. Component data for this component already exists!", status: :bad_request
          return
        end
      }
    end
    component_data = {
      name: params[:name],
      data: JSON.parse(params[:data])
    }
    response = FIREBASE.push("/component_data", component_data)
    render json: (response.success? ? response.body : "Failed to push new component data."), status: (response.success? ? :ok : :bad_request)
  end

  # curl -X PATCH -d "name=SlackMessage" -d 'data={"current_message": "testi viesti 123"}' localhost:3000/componentdata
  def update
    component_data_list = FIREBASE.get("/component_data").body
    if !component_data_list.nil?
      component_data_list.keys.map { |component_data_entry|
        if component_data_list[component_data_entry]["name"] == params[:name]
          component_data = {
            data: JSON.parse(params[:data])
          }
          response = FIREBASE.update("/component_data/#{component_data_entry}/", component_data)
          render json: (response.success? ? response.body : "Failed to update component data."), status: (response.success? ? :ok : :bad_request)
          return
        end
      }
    end
    render json: "Failed to update component data.", status: :bad_request
  end

end
