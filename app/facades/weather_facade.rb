class WeatherFacade

  def self.weather_data(long_and_lat)

    weather_data = WeatherService.get_weather(long_and_lat)
    relevant_data = select_data(weather_data)
    data_object = Forecast.new(relevant_data)
# binding.pry
  end

  def self.select_data(data)
    current_weather = {datetime: Time.at(data[:current][:dt]),
            sunrise: Time.at(data[:current][:sunrise]),
            sunset: Time.at(data[:current][:sunset]),
            temperature: data[:current][:temp],
            feels_like: data[:current][:feels_like],
            humidity: data[:current][:humidity],
            uvi: data[:current][:uvi],
            visibility: data[:current][:visibility],
            conditions: data[:current][:weather][0][:description],
            icon: data[:current][:weather][0][:icon]}


    number_of_days = 5
    daily_weather = data[:daily].first(number_of_days).map do |day|
      {date: Time.at(day[:dt]),
      sunrise: Time.at(day[:sunrise]),
      sunset: Time.at(day[:sunset]),
      max_temp: day[:temp][:max],
      min_temp: day[:temp][:min],
      conditions: day[:weather][0][:description],
      icon: day[:weather][0][:icon]}
    end

    number_of_hours = 8
    hourly_weather = data[:hourly].first(number_of_hours).map do |hour|
      {time: Time.at(hour[:dt]),
      temperature: hour[:temp],
      conditions: hour[:weather][0][:description],
      icon: hour[:weather][0][:icon]}
    end

    {hourly_weather: hourly_weather, daily_weather: daily_weather, current_weather: current_weather}
  end

  def self.weather_at_arrival(destination)
    weather_info = WeatherService.get_weather(destination[:coordinates])
# binding.pry
    if destination[:time][:hours] == "impossible"
      arival_time = destination[:hours]
      {}
    elsif destination[:time][:hours] > 48
      # binding.pry
      arival_time = weather_info[:daily][(destination[:time][:hours]/24).round]
      {termperature: arival_time[:temp], weather: arival_time[:weather][0][:description]}
    else
      arival_time = weather_info[:hourly][destination[:time][:hours]]
      {termperature: arival_time[:temp], weather: arival_time[:weather][0][:description]}
    end
  end

end
