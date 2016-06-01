class ComponentController < ApplicationController

  # curl -X POST -d "page_name=Page1" -d "name=SlackMessage" -d "width=500" -d "height=200" -d "float=left" localhost:3000/component
  def create
    page_list = FIREBASE.get("/page_config/pages").body
    if !page_list.nil?
      page_list.keys.map { |page_entry|
        if page_list[page_entry]["name"] == params[:page_name]
          component_entry = {
            name: params[:name],
            width: params[:width],
            height: params[:height],
            float: params[:float]
          }
          response = FIREBASE.push("page_config/pages/#{page_entry}/components", component_entry)
          render json: (response.success? ? response.body : "Failed to add new component to page."), status: (response.success? ? :ok : :bad_request)
          return
        end
      }
      render json: "Invalid page name.", status: :bad_request
      return
    end
    render json: "No pages found. Create a page first!", status: :bad_request
  end

  # curl -X PATCH -d "page_name=Page1" -d "component_id=-KJAUvq0Img6DEXPPFWI" -d "width=800" localhost:3000/component
  def update
    page_list = FIREBASE.get("/page_config/pages").body
    if !page_list.nil?
      page_list.keys.map { |page_entry|
        if page_list[page_entry]["name"] == params[:page_name]
          page_list[page_entry]["components"].map { |component_entry_id|
            if component_entry_id.first == params[:component_id]
              component_entry = {
                name: (params[:name].nil? ? component_entry_id.second['name'] : params[:name]),
                width: (params[:width].nil? ? component_entry_id.second['width'] : params[:width]),
                height: (params[:height].nil? ? component_entry_id.second['height'] : params[:height]),
                float: (params[:float].nil? ? component_entry_id.second['float'] : params[:float]),
              }
              response = FIREBASE.update("page_config/pages/#{page_entry}/components/#{component_entry_id.first}", component_entry)
              render json: (response.success? ? response.body : "Failed to update page component."), status: (response.success? ? :ok : :bad_request)
              return
            end
          }
          render json: "Invalid component_id.", status: :bad_request
          return
        end
      }
      render json: "Invalid page name.", status: :bad_request
      return
    end
    render json: "No pages found. Create a page first!", status: :bad_request
  end

  # curl -X DELETE -d "page_name=Page1" -d "component_id=-KJAUvq0Img6DEXPPFWI" localhost:3000/component
  def destroy
    page_list = FIREBASE.get("/page_config/pages").body
    if !page_list.nil?
      page_list.keys.map { |page_entry|
        if page_list[page_entry]["name"] == params[:page_name]
          page_list[page_entry]["components"].map { |component_entry_id|
            if component_entry_id.first == params[:component_id]
              response = FIREBASE.delete("page_config/pages/#{page_entry}/components/#{component_entry_id.first}")
              render json: (response.success? ? "Page component removed." : "Failed to remove page component."), status: (response.success? ? :ok : :bad_request)
              return
            end
          }
          render json: "Invalid component_id.", status: :bad_request
          return
        end
      }
      render json: "Invalid page name.", status: :bad_request
      return
    end
    render json: "No pages found. Create a page first!", status: :bad_request
  end

end
