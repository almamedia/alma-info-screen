class ConfigController < ApplicationController

  def index
    page_config = [
      {
        id: 1,
        components: [
          {
            name: "SlackMessage",
            description: "Slack Message component",
            width: 400,
            height: 300,
            position_x: 1,
            position_y: 1
          },
          {
            name: "RedisAlert",
            description: "Redis alert component",
            width: 400,
            height: 300,
            position_x: 5,
            position_y: 5
          }
        ]
      },
      {
        id: 2,
        components: [
          {
            name: "SlackMessage",
            description: "Slack Message component",
            width: 400,
            height: 300,
            position_x: 1,
            position_y: 1
          }
        ]
      }
    ]
    render json: page_config
  end

  def show
  end

  def create
  end

  def update
  end

end
