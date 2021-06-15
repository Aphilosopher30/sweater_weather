# require 'rails_helper'
#
# RSpec.describe 'users request api tests', type: :request do
#
#   describe "create a new user" do
#     it "it makes a new user" do
#
#       test_user = User.find_by(email: "test@ts.com")
#
#       expect(test_user).to eq(nil)
#
#       post '/api/v1/users'
#
#       # test_user_new = User.find_by(email: "test@ts.com")
#       #
#       # expect(test_user_new.class).to eq(User)
#
#       # expect(response).to be_successful
#       # expect(response.status).to eq(200)
#       # expect(response.content_type).to eq("application/json")
#     end
#
#     describe "sad paths" do
#       it 'paswords do not match' do
#
#         post '/api/v1/users'
#
#         # expect(response.status).to eq(400)
#
#       end
#
#       it 'email already in use' do
#         pre_existing_user = User.create(email: "test@ts.com", api_key: "testit")
#
#         post '/api/v1/users'
#
#         # expect(response.status).to eq(400)
#
#
#       end
#
#       it 'faild left blank' do
#
#         post '/api/v1/users'
#
#          expect(response.status).to eq(400)
#       end
#
#     end
#
#
#   end
#
# end
