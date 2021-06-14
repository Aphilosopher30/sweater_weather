class Forecast
  attr_reader :id, :hourly_weather, :daily_weather, :current_weather

  def initialize(data)
    @id = nil
    @hourly_weather = data[:hourly_weather]
    @daily_weather = data[:daily_weather]
    @current_weather = data[:current_weather]
  end
end
