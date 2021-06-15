class Api::V1::ForecastController < ApplicationController
  def show
    coordinates = CoordinateFacade.get_coordinates(params[:location])
    weather_data = WeatherFacade.weather_data(coordinates)

    render json: ForecastSerializer.new(weather_data)
  end

end
