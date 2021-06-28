class Api::V1::RoadTripController < ApplicationController
  def create

    user = User.find_by(api_key: params[:api_key])
    origin = params[:origin]
    destination = params[:destination]

    if user == nil

      render json: {error: "Unauthorized"}, :status => 401

    else

      trip_time = CoordinateFacade.destination_info(origin, destination)
      weather_at_eta = WeatherFacade.weather_at_arrival(trip_time)
      test = {start_city: origin,
      end_city: destination,
      time: trip_time[:time][:formated_time],
      weather_at_eta: weather_at_eta
      }
      trip = RoadTrip.new(test)

      render json: RoadTripSerializer.new(trip)
    end

    # binding.pry
    # def self.connection
    #   Faraday.new(url: 'https://api.unsplash.com/') do |faraday|
    #     faraday.params['client_id'] = ENV['photo_key']
    #   end
    # end
    #
    # def self.parse_json(resp)
    #   JSON.parse(resp.body, symbolize_names: true)
    # end
    #
    # def self.city_picture(city_state)
    #   response = connection.get('/search/photos') do |faraday|
    #     faraday.params[:query] = city_state
    #   end
    #   parse_json(response)
    # end



  end

end
