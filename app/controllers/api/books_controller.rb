module Api
  class BooksController < ApplicationController
    before_action :set_book, only: %i[show update destroy]

    # GET /books
    def index
      @books = Book.new_books(current_api_user)

      render json: BookSerializer.new(@books).serialized_json, status: :ok
    end

    # GET /books/1
    def show
      render json: BookSerializer.new(@book).serialized_json, status: :ok
    end

    # POST /books
    def create
      @book = Book.new(book_params)

      if @book.save
        render json: BookSerializer.new(@book).serialized_json, status: :created, location: @book
      else
        render json: { errors: @book.errors }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /books/1
    def update
      if @book.update(book_params)
        render json: BookSerializer.new(@book).serialized_json, status: :ok
      else
        render json: { errors: @book.errors }, status: :unprocessable_entity
      end
    end

    # DELETE /books/1
    def destroy
      @book.destroy
    end

    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :cover_image_url, :page_count, :publisher, :synopsis)
    end
  end
end
