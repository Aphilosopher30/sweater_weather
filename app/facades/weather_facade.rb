class WeatherFacade

  def self.weather_data(long_and_lat)

    weather_data = WeatherService.get_weather(long_and_lat)
    relevant_data = select_data(weather_data)
    data_object = Forecast.new(relevant_data)
# binding.pry
  end

  def self.select_data(data)
    current_weather = {datetime: data[:current][:dt],
            sunrise: data[:current][:sunrise],
            sunset: data[:current][:sunset],
            temperature: data[:current][:temp],
            feels_like: data[:current][:feels_like],
            humidity: data[:current][:humidity],
            uvi: data[:current][:uvi],
            visibility: data[:current][:visibility],
            conditions: data[:current][:weather][0][:description],
            icon: data[:current][:weather][0][:icon]}

    number_of_days = 5
    daily_weather = data[:daily].first(number_of_days).map do |day|
      {date: day[:dt],
      sunrise: day[:sunrise],
      sunset: day[:sunset],
      max_temp: day[:temp][:max],
      min_temp: day[:temp][:min],
      conditions: day[:weather][0][:description],
      icon: day[:weather][0][:icon]}
    end

    number_of_hours = 8
    hourly_weather = data[:hourly].first(number_of_hours).map do |hour|
      {time: hour[:dt],
      temperature: hour[:temp],
      conditions: hour[:weather][0][:description],
      icon: hour[:weather][0][:icon]}
    end

    {hourly_weather: hourly_weather, daily_weather: daily_weather, current_weather: current_weather}
  end


end
