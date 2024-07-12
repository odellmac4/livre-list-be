class BookFacade
  def self.book_search(keyword)
    service = BooksService.new
    books = service.volumes(keyword)

    books[:items].map do |book|
      Book.new(book)
    end
  end
end