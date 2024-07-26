class BookshelfFacade
  def self.user_bookshelves(uid)
    service = BooksService.new
    bookshelves_response = service.bookshelves(uid)
    shelves = bookshelves_response[:items].map{|shelf| Bookshelf.new(shelf)}
  end

  def self.user_bookshelf(data)
    service = BooksService.new
    bookshelf_response = service.bookshelf(data)
    bookshelf = Bookshelf.new(bookshelf_response)
  end

  def self.books(data)
    service = BooksService.new
    bookshelf_books_response = service.bookshelf(data)
    bookshelf_books = bookshelf_books_response[:items].map do |book|
      Book.new(book)
    end
  end
end