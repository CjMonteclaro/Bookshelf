# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!
  
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
      message: 'Logged in sucessfully.'
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "Logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
