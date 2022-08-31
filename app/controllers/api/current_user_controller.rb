module Api
  class CurrentUserController < ApplicationController
    def index
      render json: current_user, status: :ok
    end
  end
end
