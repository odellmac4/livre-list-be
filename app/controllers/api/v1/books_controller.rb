class Api::V1::BooksController < ApplicationController
  def index
    books = BookFacade.book_search(params[:search])
    render json: BookSerializer.list_books(books), status: :ok
  end
end