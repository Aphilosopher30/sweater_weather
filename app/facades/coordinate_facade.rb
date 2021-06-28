class CoordinateFacade

  def self.get_coordinates(city_state)

    location_data = CoordinatesService.geo_coordinates(city_state)
    coordinates = location_data[:results].first[:locations][0][:displayLatLng]
  end

  def self.rout_time_hours(start, destination)
    response = CoordinatesService.directions(start, destination)
    # if x
    #   # return {}
    #
    # end
    seconds = response[:route][:realTime]
    hours = (seconds/(60.0)**2).round
    formated_time = response[:route][:formattedTime]
    {hours: hours, formated_time: formated_time}
  end

  def self.destination_info(start, destination)
    coordinates = get_coordinates(destination)
    time = rout_time_hours(start, destination)
    {time: time, coordinates: coordinates}
  end

end
