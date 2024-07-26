class Bookshelf
  attr_reader :id, :title, :access, :book_count

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @access = data[:access]
    @book_count = data[:volumeCount]
  end
end