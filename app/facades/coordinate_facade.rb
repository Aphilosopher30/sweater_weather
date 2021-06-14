class CoordinateFacade

  def self.get_coordinates(city_state)

    location_data = CoordinatesService.geo_coordinates(city_state)
    coordinates = location_data[:results].first[:locations][0][:displayLatLng]
  end

end
