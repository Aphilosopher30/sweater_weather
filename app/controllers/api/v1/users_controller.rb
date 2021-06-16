class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: %i[new create]

  def create
    api_key = SecureRandom.hex
    while User.find_by(api_key: api_key) != nil
      api_key = SecureRandom.hex
    end

    if params[:password].nil? || params[:password_confirmation].nil? || params[:email] == nil
      render json: {error: "you need to fill out all features"}, :status => 400
      # binding.pry

    elsif User.find_by(email: params[:email].downcase) != nil
      render json: {error: "you cannot use this email"}, :status => 400
      # binding.pry

    elsif params[:password] != params[:password_confirmation]
      render json: {error: "passwords do not match"}, :status => 400
      # binding.pry

    else
      new_user = User.create(email: params[:email].downcase, password: params[:password], password_confirmation: params[:password_confirmation], api_key: api_key)
      render json: UserSerializer.new(new_user)
      # binding.pry

    end
  end


end
