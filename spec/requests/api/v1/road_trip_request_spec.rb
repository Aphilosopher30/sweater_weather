require 'rails_helper'

RSpec.describe 'road_trip request api tests', type: :request do

  describe "road_trip makes a new " do

    it "gives a proper response " do
      it "it  adds a new road_trip to the data base  " do

        road_trip = RoadTrip.find_by()

        expect(road_trip).to eq(nil)

        post '/api/v1/users', params: {}

        user = JSON.parse(response.body, symbolize_names: true)

        test_user_new = User.find_by()

        expect(test_user_new.class).to eq(RoadTrip)
      end

      it "gives a proper response " do

        post '/api/v1/road_trip', params: {}

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response.content_type).to eq("application/json")

        road_trip = JSON.parse(response.body, symbolize_names: true)
        # binding.pry
        expect(user[:data][:id]).to eq(nil)
        expect(user[:data][:type]).to eq("roadtrip")

        expect(user[:data][:attributes]).to be_a(Hash)
        expect(user[:data][:attributes].size).to eq(4)
        expect(user[:data][:attributes]).to have_key(:start_city)
        expect(user[:data][:attributes][:start_city]).to be_a(String)
        expect(user[:data][:attributes]).to have_key(:end_city)
        expect(user[:data][:attributes][:end_city]).to be_a(String)
        expect(user[:data][:attributes]).to have_key(:travel_time)
        expect(user[:data][:attributes][:travel_time]).to be_a(String)
        expect(user[:data][:attributes]).to have_key(:weather_at_eta)
        expect(user[:data][:attributes][:weather_at_eta]).to be_a(Hash)
        expect(user[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(user[:data][:attributes][:weather_at_eta]).to have_key(:temperature)

      end

    describe "sad paths" do


      

    end


  end

end
