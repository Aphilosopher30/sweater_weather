class ForcastController < ApplicationController
  def show

    # binding.pry
    test = CoordinatesService.geo_coordinates(params[:location])

  end

end
