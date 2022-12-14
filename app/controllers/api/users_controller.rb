module Api
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show update destroy]
    before_action :authorize_request, except: :create
    
    # GET /users
    def index
      @users = User.all

      render json: UserSerializer.new(@users).serialized_json, status: :ok
    end

    # GET /users/1
    def show
      render json: UserSerializer.new(@user).serialized_json, status: :ok
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        render json: UserSerializer.new(@user).serialized_json, status: :created
      else
        render json: { errors: @user.errors }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: UserSerializer.new(@user).serialized_json, status: :ok
      else
        render json: { errors: @user.errors }, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
  end
end
