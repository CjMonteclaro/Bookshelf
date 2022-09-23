module Api
  class CurrentUserController < ApplicationController
    def index
      render json: UserSerializer.new(@current_user).serialized_json, status: :ok
    end
  end
end
