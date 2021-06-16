class Api::V1::SessionsController < ApplicationController

  def login
    if params[:email] != nil
      user = User.find_by(email: params[:email].downcase)
    end

    if params[:password] == nil || params[:email] == nil
      render json: {error: "plese send both an email and a password"}, :status => 400
    elsif user == nil
      render json: {error: "your password or email is incorrect"}, :status => 400
    elsif params[:password] != user.password
      render json: {error: "your password or email is incorrect"}, :status => 400
    else
      render json: UserSerializer.new(user)
    end
  end
end
