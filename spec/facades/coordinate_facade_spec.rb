require 'rails_helper'

RSpec.describe CoordinateFacade do

  context ' class methods' do
    it 'gets coordinates' do

      json_response = File.read('spec/fixtures/coordinates/coordinates.json')

      stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['map_quest_key']}&location=Denver,CO").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.2'
          }).
        to_return(status: 200, body: json_response, headers: {})

      test = CoordinateFacade.get_coordinates("Denver,CO")


      expect(test).to eq({:lat=>39.738453, :lng=>-104.984853})
    end

  end
end
