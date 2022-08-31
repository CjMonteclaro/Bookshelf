# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

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
        status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence }" }
      }, status: :unprocessable_entity
    end
  end
end
