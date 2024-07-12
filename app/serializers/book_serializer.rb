class BookSerializer
  def self.list_books(books)
    books.as_json
  end
end