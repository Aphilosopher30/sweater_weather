class Api::V1::SessionsController < ApplicationController

  def login

    user = User.find_by(email: params[:email])
    if user == nil
      render json: {error: "your password or email is incorrect"}, :status => 400
    elsif params[:password] != user.password
      render json: {error: "your password or email is incorrect"}, :status => 400
    else
      render json: UserSerializer.new(user)
    end
  end

end
