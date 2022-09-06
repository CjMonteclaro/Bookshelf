# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_api_user!

  respond_to :json

  private
  
  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
        message: "Signed up successfully."
      }
    else
      render json: {
        message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence }"
      }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.require(:user).permit(:username, :email, :password)
  end
end
