class CoordinatesService

  def self.connection
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['map_quest_key']
    end
  end

  def self.parse_json(resp)
    JSON.parse(resp.body, symbolize_names: true)
  end




  def self.geo_coordinates(city_state)
    # paramiters = {location: city_state}
    response = connection.get('/geocoding/v1/address') do |faraday|
      faraday.params[:location] = city_state
    end

    parse_json(response)
# binding.pry

    # future_refactor = parse_json(response)
    #
    # x = future_facade(future_refactor)

  end






end
