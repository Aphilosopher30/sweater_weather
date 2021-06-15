class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: %i[new create]

  def create

    api_key = SecureRandom.hex
    while User.find_by(api_key: api_key) != nil
      api_key = SecureRandom.hex
    end

    if params[:password].nil? || params[:password_confirmation].nil? || params[:email].nil?
      render json: {description: "you need to fill out all features"}, :status => 400

    elsif User.find_by(email: params[:email]) != nil
      render json: {description: "you cannot use this email"}, :status => 400

    elsif params[:password] != params[:password_confirmation]
      render json: {description: "passwords do not match"}, :status => 400

    else
      new_user = User.create(email: params[:email], password: params[:password], api_key: api_key)
      render json: UserSerializer.new(new_user)
    end
  end

end
