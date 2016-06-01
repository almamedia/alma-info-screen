class PageController < ApplicationController

  # curl -X GET localhost:3000/page
  def index
    response = FIREBASE.get("/page_config/pages")
    render json: (response.success? ? response.body : "Failed to get current page configuration."), status: (response.success? ? :ok : :bad_request)
  end

  # curl -X GET localhost:3000/page/Page1
  def show
    page_list = FIREBASE.get("/page_config/pages").body
    if !page_list.nil?
      page_list.keys.map { |page_entry|
        if page_list[page_entry]["name"] == params[:id]
          render json: page_list[page_entry]
          return
        end
      }
    end
    render json: "Failed to get page data.", status: :bad_request
  end

  # curl -X POST -d "name=Page1" localhost:3000/page
  def create
    page_list = FIREBASE.get("/page_config/pages").body
    if !page_list.nil?
      page_list.keys.map { |page_entry|
        if page_list[page_entry]["name"] == params[:name]
          render json: "Failed to push new page. Page with this ID already exists!", status: :bad_request
          return
        end
      }
    end
    page_config = {
      name: params[:name],
      components: {}
    }
    response = FIREBASE.push("page_config/pages", page_config)
    render json: (response.success? ? response.body : "Failed to push new page."), status: (response.success? ? :ok : :bad_request)
  end

end
