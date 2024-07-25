class BookFacade
  def self.book_search(keyword)
    service = BooksService.new
    books = service.volumes(keyword)

    books[:items].map do |book|
      Book.new(book)
    end
  end

  def self.book_by_id(id)
    service = BooksService.new
    book = service.volume(id)
    Book.new(book)
  end
end