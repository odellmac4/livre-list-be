require 'rails_helper'

RSpec.describe BookshelfFacade do

  it 'creates bookshelf poros from response' do
    VCR.use_cassette("Bookshelf_facade", record: :new_episodes) do
      data = {uid: 106196942824430802445, shelf_id: 1001, q: "books"}
      bookshelves = BookshelfFacade.user_bookshelves(data[:uid])
      
      expect(bookshelves).to be_an Array
      expect(bookshelves.first).to be_a Bookshelf
    end
  end
  it 'creates bookshelf poro from response' do
    VCR.use_cassette("Bookshelf_facade/shelf", record: :new_episodes) do
      data = {uid: 106196942824430802445, shelf_id: 1001}
      bookshelf = BookshelfFacade.user_bookshelf(data)
      
      expect(bookshelf).to be_a Bookshelf
      
    end
  end
  it 'creates book poros for a bookshelf' do
    VCR.use_cassette("Bookshelf_facade/shelf_books", record: :new_episodes) do
      data = {uid: 106196942824430802445, shelf_id: 1001, books: true}
      books = BookshelfFacade.books(data)
      expect(books).to be_an Array
      expect(books.first).to be_a Book
      
    end
  end
end