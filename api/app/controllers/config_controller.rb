class ConfigController < ApplicationController

  def index
    base_uri = 'https://il-info-screen.firebaseio.com'
    secret_key = 'KY7HTxLVhKaIP9X12dqXLxcErGB0lzLjtsCH5W6b'
    firebase = Firebase::Client.new(base_uri, secret_key)
    response = firebase.get("/")
    render json: (response.success? ? response.body : "Failed to get current page configuration.")
  end

  def show
  end

  def create
    page1_components = [
      {
        name: "SlackMessage",
        width: 400,
        height: 300,
        position_x: 1,
        position_y: 1
      },
      {
        name: "RedisAlert",
        width: 400,
        height: 300,
        position_x: 1,
        position_y: 1
      }
    ]

    page2_components = [
      {
        name: "SlackMessage",
        width: 400,
        height: 300,
        position_x: 1,
        position_y: 1
      }
    ]

    componen_data = [
      {
        name: "SlackMessage",
        data: {
          current_message: ''
        }
      },
      {
        name: "RedisAlert",
        data: {
          prod_status: 'online',
          dev_status: 'online'
        }
      }
    ]

    base_uri = 'https://il-info-screen.firebaseio.com'
    secret_key = 'KY7HTxLVhKaIP9X12dqXLxcErGB0lzLjtsCH5W6b'
    firebase = Firebase::Client.new(base_uri, secret_key)
    response = firebase.push("page_config/pages", page1_components)
    response = firebase.push("page_config/pages", page2_components)
    response = firebase.push("component_data", componen_data)

    render json: (response.success? ? response.body : "Failed to push new page configuration.")
  end

  def update
  end

end
