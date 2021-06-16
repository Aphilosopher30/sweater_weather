class ApplicationController < ActionController::API

  def return_error(message)
    render json: {error: message}, :status => 400
  end
end
