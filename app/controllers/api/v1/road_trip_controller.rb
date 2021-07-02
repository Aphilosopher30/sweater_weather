class Api::V1::RoadTripController < ApplicationController


  def create

    user = User.find_by(api_key: params[:api_key])
    origin = params[:origin]
    destination = params[:destination]

    if user == nil
      render json: {error: "Unauthorized"}, :status => 401
    else

      trip_time = CoordinateFacade.destination_info(origin, destination)

      # binding.pry
      weather_at_eta = WeatherFacade.weather_at_arrival(trip_time)

      test = {start_city: origin,
      end_city: destination,
      time: trip_time[:time][:formated_time],
      weather_at_eta: weather_at_eta
      }
      trip_poro = RoadTripPoro.new(test)

      new_trip = RoadTrip.create(start_city: origin, end_city: destination)


      render json: RoadTripSerializer.new(trip_poro)
    end
  end
end
