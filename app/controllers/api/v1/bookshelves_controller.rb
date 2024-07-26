class Api::V1::BookshelvesController < ApplicationController
  def index
    bookshelves = BookshelfFacade.user_bookshelves(params[:user_id])
    render json: BookSerializer.list_books(bookshelves), status: :ok
  end

  def show
    bookshelf = BookshelfFacade.user_bookshelf(bookshelf_params)
    render json: BookSerializer.list_books(bookshelf), status: :ok
  end

  private

  def bookshelf_params
    bookshelf_params = {
      uid: params[:user_id],
      shelf_id: params[:id]
    }
  end
end

