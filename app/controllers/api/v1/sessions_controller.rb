class Api::V1::SessionsController < ApplicationController

  def create

    test = User.find_by(email: params[:email])
# binding.pry
    render json: UserSerializer.new(test)
  end

end
