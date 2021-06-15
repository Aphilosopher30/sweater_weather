class Picture
  attr_reader :id, :image_url, :credits

  def initialize(data)
    @id = nil
    @image_url = data[:image_url]
    @credits = data[:credits]
  end
end
