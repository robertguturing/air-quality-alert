class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]
  def show
    if @user == current_user
      response = AirQualityService.get_air_quality(@user.city)
      @air_quality_index = parse_air_quality(response)
    else
      flash[:alert] = "You are not authorized to view that page"
      redirect_to root_path
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def parse_air_quality(response)
    status = JSON.parse(response.body)["status"]
    if status == "ok"
      JSON.parse(response.body)["data"]["aqi"]
    else
      "Could not find air quality index for the city #{@user.city}"
    end
  end
end
