module Api
  class ListItemsController < ApplicationController
    before_action :set_list_item, only: %i[ show update destroy ]
    before_action :authenticate_user!

    # GET /list_items
    def index
      @list_items = ListItem.all
      render json: @list_items
    end

    def reading_list
      @list_items = ListItem.where(owner_id: current_user.id).reading_list
      render json: @list_items
    end

    def finished
      @list_items = ListItem.where(owner_id: current_user.id).finished
      render json: @list_items
    end

    # GET /list_items/1
    def show
      render json: @list_item
    end

    # POST /list_items
    def create
      @list_item = ListItem.new(list_item_params)

      if @list_item.save
        render json: @list_item, status: :created, location: @list_item
      else
        render json: @list_item.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /list_items/1
    def update
      if @list_item.update(list_item_params)
        render json: @list_item
      else
        render json: @list_item.errors, status: :unprocessable_entity
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
      params.require(:list_item).permit(:book_id, :owner_id, :rating, :notes, :start_date, :finish_date)
    end
  end
end
