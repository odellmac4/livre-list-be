class Api::V1::BookshelfBooksController < ApplicationController
  def index
    books = BookshelfFacade.books(bookshelf_books_params)
    render json: BookSerializer.list_books(books), status: :ok
  end

  private

  def bookshelf_books_params
    bookshelf_books_params = {
      uid: params[:user_id],
      shelf_id: params[:bookshelf_id],
      books: true
    }
  end
end