require 'rails_helper'

RSpec.describe BooksService do
  before(:each) do
    @service = BooksService.new
  end

  it 'is a service' do
    expect(@service).to be_a BooksService
  end

  it 'establishes a connection' do
    expect(@service.conn).to be_a Faraday::Connection
  end

  it 'retrieves list of books from a keyword search' do
    VCR.use_cassette("books_keyword_search", record: :new_episodes) do
      books = @service.volumes("freedom writers")
      expect(books).to be_a Hash
      expect(books).to have_key(:kind)
      expect(books).to have_key(:totalItems)
      expect(books).to have_key(:items)

      book = books[:items].first
      expect(book).to be_a Hash
      expect(book).to have_key(:kind)
      expect(book).to have_key(:id)
      expect(book).to have_key(:etag)
      expect(book).to have_key(:selfLink)
      expect(book).to have_key(:volumeInfo)
      expect(book[:volumeInfo]).to be_a Hash

      book_info = book[:volumeInfo]
      expect(book_info).to have_key(:title)
      expect(book_info).to have_key(:subtitle)
      expect(book_info).to have_key(:authors)
      expect(book_info[:authors]).to be_an Array
      expect(book_info).to have_key(:publisher)
      expect(book_info).to have_key(:publishedDate)
      expect(book_info).to have_key(:description)
      expect(book_info).to have_key(:industryIdentifiers)
      expect(book_info[:industryIdentifiers]).to be_an Array
      expect(book_info[:industryIdentifiers].first).to be_a Hash
      expect(book_info).to have_key(:readingModes)
      expect(book_info[:readingModes]).to be_a Hash
      expect(book_info).to have_key(:pageCount)
      expect(book_info).to have_key(:printType)
      expect(book_info).to have_key(:categories)
      expect(book_info[:categories]).to be_an Array
      expect(book_info).to have_key(:averageRating)
      expect(book_info).to have_key(:ratingsCount)
      expect(book_info).to have_key(:maturityRating)
      expect(book_info).to have_key(:allowAnonLogging)
      expect(book_info).to have_key(:contentVersion)
      expect(book_info).to have_key(:panelizationSummary)
      expect(book_info[:panelizationSummary]).to be_a Hash
      expect(book_info).to have_key(:imageLinks)
      expect(book_info[:imageLinks]).to be_a Hash
      expect(book_info[:imageLinks]).to have_key(:smallThumbnail)
      expect(book_info[:imageLinks]).to have_key(:thumbnail)
      expect(book_info).to have_key(:language)
      expect(book_info).to have_key(:previewLink)
      expect(book_info).to have_key(:infoLink)
      expect(book_info).to have_key(:canonicalVolumeLink)

      sale_info = book[:saleInfo]
      expect(sale_info).to be_a Hash
      expect(sale_info).to have_key(:country)
      expect(sale_info).to have_key(:saleability)
      expect(sale_info).to have_key(:isEbook)
      expect(sale_info).to have_key(:listPrice)
      expect(sale_info[:listPrice]).to have_key(:amount)
      expect(sale_info[:listPrice]).to have_key(:currencyCode)
      expect(sale_info).to have_key(:retailPrice)
      expect(sale_info[:retailPrice]).to have_key(:amount)
      expect(sale_info[:retailPrice]).to have_key(:currencyCode)
      expect(sale_info).to have_key(:buyLink)
      expect(sale_info).to have_key(:offers)
      expect(sale_info[:offers]).to be_an Array 
      
    end
  end

  it 'retrieves all user bookshelves when provided with a user id' do
    VCR.use_cassette("user_bookshelves", record: :new_episodes) do
      uid = 106196942824430802445
      bookshelves = @service.bookshelves(uid)
      expect(bookshelves).to be_a Hash
      expect(bookshelves).to have_key(:kind)
      expect(bookshelves[:kind]).to eq("books#bookshelves")
      expect(bookshelves).to have_key(:items)
      expect(bookshelves[:items]).to be_an Array

      bookshelf = bookshelves[:items].last
      expect(bookshelf).to have_key(:kind)
      expect(bookshelf).to have_key(:id)
      expect(bookshelf).to have_key(:title)
      expect(bookshelf).to have_key(:description)
      expect(bookshelf).to have_key(:access)
      expect(bookshelf).to have_key(:updated)
      expect(bookshelf).to have_key(:created)
      expect(bookshelf).to have_key(:volumeCount)
      expect(bookshelf).to have_key(:volumesLastUpdated)
      expect(bookshelf[:kind]).to eq("books#bookshelf")
      expect(bookshelf[:id]).to eq(1001)
      expect(bookshelf[:title]).to eq("For the Culture")
      expect(bookshelf[:description]).to eq("Books written by black authors and/or books that highlight black stories.")
      expect(bookshelf[:access]).to eq("PUBLIC")
      expect(bookshelf[:updated]).to eq("2024-07-25T19:09:33.686Z")
      expect(bookshelf[:created]).to eq("2024-07-25T19:09:33.686Z")
      expect(bookshelf[:volumeCount]).to eq(6)
      expect(bookshelf[:volumesLastUpdated]).to eq("2024-07-25T19:09:33.685Z")
    end
  end
  it 'retrieves user bookshelf when provided with a user id and shelf id' do
    VCR.use_cassette("user_bookshelf", record: :new_episodes) do
      data = {uid: 106196942824430802445, shelf_id: 1001}
      bookshelf = @service.bookshelf(data)
      expect(bookshelf).to have_key(:kind)
      expect(bookshelf).to have_key(:id)
      expect(bookshelf).to have_key(:title)
      expect(bookshelf).to have_key(:description)
      expect(bookshelf).to have_key(:access)
      expect(bookshelf).to have_key(:updated)
      expect(bookshelf).to have_key(:created)
      expect(bookshelf).to have_key(:volumeCount)
      expect(bookshelf).to have_key(:volumesLastUpdated)
      expect(bookshelf[:kind]).to eq("books#bookshelf")
      expect(bookshelf[:id]).to eq(1001)
      expect(bookshelf[:title]).to eq("For the Culture")
      expect(bookshelf[:description]).to eq("Books written by black authors and/or books that highlight black stories.")
      expect(bookshelf[:access]).to eq("PUBLIC")
      expect(bookshelf[:updated]).to eq("2024-07-25T19:09:33.686Z")
      expect(bookshelf[:created]).to eq("2024-07-25T19:09:33.686Z")
      expect(bookshelf[:volumeCount]).to eq(6)
      expect(bookshelf[:volumesLastUpdated]).to eq("2024-07-25T19:09:33.685Z")
    end
  end

  it 'retrieves user bookshelf books when provided with a user id, shelf id and query param of q=books' do
    VCR.use_cassette("user_bookshelf_books", record: :new_episodes) do
      data = {uid: 106196942824430802445, shelf_id: 1001, books: true}
      bookshelf_books = @service.bookshelf(data)
      expect(bookshelf_books).to have_key(:kind)
      expect(bookshelf_books).to have_key(:items)
      expect(bookshelf_books).to have_key(:totalItems)
      
      expect(bookshelf_books[:kind]).to eq("books#volumes")
      expect(bookshelf_books[:items]).to be_an Array
      expect(bookshelf_books[:items].length).to eq(6)
      expect(bookshelf_books[:totalItems]).to eq(6)

      book = bookshelf_books[:items].first
      expect(book).to be_a Hash
      expect(book).to have_key(:kind)
      expect(book).to have_key(:id)
      expect(book).to have_key(:etag)
      expect(book).to have_key(:selfLink)
      expect(book).to have_key(:volumeInfo)
      expect(book[:volumeInfo]).to be_a Hash

      book_info = book[:volumeInfo]
      expect(book_info).to have_key(:title)
      expect(book_info).to have_key(:subtitle)
      expect(book_info).to have_key(:authors)
      expect(book_info[:authors]).to be_an Array
      expect(book_info).to have_key(:publisher)
      expect(book_info).to have_key(:publishedDate)
      expect(book_info).to have_key(:description)
      expect(book_info).to have_key(:industryIdentifiers)
      expect(book_info[:industryIdentifiers]).to be_an Array
      expect(book_info[:industryIdentifiers].first).to be_a Hash
      expect(book_info).to have_key(:readingModes)
      expect(book_info[:readingModes]).to be_a Hash
      expect(book_info).to have_key(:pageCount)
      expect(book_info).to have_key(:printType)
      expect(book_info).to have_key(:categories)
      expect(book_info[:categories]).to be_an Array
      expect(book_info).to have_key(:maturityRating)
      expect(book_info).to have_key(:allowAnonLogging)
      expect(book_info).to have_key(:contentVersion)
      expect(book_info).to have_key(:panelizationSummary)
      expect(book_info[:panelizationSummary]).to be_a Hash
      expect(book_info).to have_key(:imageLinks)
      expect(book_info[:imageLinks]).to be_a Hash
      expect(book_info[:imageLinks]).to have_key(:smallThumbnail)
      expect(book_info[:imageLinks]).to have_key(:thumbnail)
      expect(book_info).to have_key(:previewLink)
      expect(book_info).to have_key(:infoLink)
      expect(book_info).to have_key(:canonicalVolumeLink)

      sale_info = book[:saleInfo]
      expect(sale_info).to be_a Hash
      expect(sale_info).to have_key(:country)
      expect(sale_info).to have_key(:saleability)
      expect(sale_info).to have_key(:isEbook)
    end
  end
end