module Api
  class ListItemsController < ApplicationController
    before_action :set_list_item, only: %i[show update destroy]

    # GET /list_items
    def index
      @list_items = ListItem.all
      render json: ListItemSerializer.new(@list_items).serialized_json, status: :ok
    end

    def reading_list
      @list_items = ListItem.where(user_id: @current_user.id).reading_list
      render json: ListItemSerializer.new(@list_items).serialized_json, status: :ok
    end

    def finished
      @list_items = ListItem.where(user_id: @current_user.id).finished
      render json: ListItemSerializer.new(@list_items).serialized_json, status: :ok
    end

    # GET /list_items/1
    def show
      render json: ListItemSerializer.new(@list_item).serialized_json, status: :ok
    end

    # POST /list_items
    def create
      @list_item = ListItem.new(list_item_params)

      if @list_item.save
        render json: ListItemSerializer.new(@list_item).serialized_json, status: :created
      else
        render json: { errors: @list_item.errors }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /list_items/1
    def update
      if @list_item.update(list_item_params)
        render json: ListItemSerializer.new(@list_item).serialized_json, status: :ok
      else
        render json: { errors: @list_item.errors }, status: :unprocessable_entity
      end
    end

    # DELETE /list_items/1
    def destroy
      @list_item.destroy
    end

    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.require(:list_item).permit(:book_id, :user_id, :rating, :notes, :start_date, :finish_date)
    end
  end
end
