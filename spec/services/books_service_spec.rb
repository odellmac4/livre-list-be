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
end