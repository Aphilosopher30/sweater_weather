require 'rails_helper'

RSpec.describe 'coordinates request api tests', type: :request do

  describe "returns coordinates" do
    it "returns the desired coordinates" do

      json_response = File.read('spec/fixtures/coordinates/coordinates.json')

      stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['map_quest_key']}&location=Denver,CO").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.2'
          }).
        to_return(status: 200, body: json_response, headers: {})


      get '/api/v1/forecast?location=Denver,CO'


# binding.pry
      # coordinates  = JSON.parse(response.body, symbolize_names: true)

      # expect(response).to be_successful



      # expect(merchants["data"].count).to eq(3)
      #
      # expect(merchants["data"][0]["id"]).to eq(merchant_1.id.to_s)
      # expect(merchants["data"][0]['attributes']["name"]).to eq(merchant_1.name)
      #
      # expect(merchants["data"][1]["id"]).to eq(merchant_2.id.to_s)
      # expect(merchants["data"][1]['attributes']["name"]).to eq(merchant_2.name)
      #
      # expect(merchants["data"][2]["id"]).to eq(merchant_3.id.to_s)
      # expect(merchants["data"][2]['attributes']["name"]).to eq(merchant_3.name)
    end
  end

end
