class PicturesFacade

  def self.city_picture(city_state)

    pictures = PicturesService.city_picture(city_state)
    # binding.pry
    all_info = pictures[:results].first
    data = {
        location: city_state,
        image_url: all_info[:urls][:raw],
        credits: {
          source: "From unsplash.com",
          photographer: all_info[:user][:name]
        }
      }
    object = Picture.new(data)
  end

end
