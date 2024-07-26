require 'rails_helper'

RSpec.describe "Bookshelves requests" do
  describe 'bookshelves index' do
    it 'returns bookshelves when provided with user id'do
      VCR.use_cassette("Bookshelves_request", record: :new_episodes) do
        get '/api/v1/users/106196942824430802445/bookshelves'

        expect(response).to be_successful

        bookshelves_response = JSON.parse(response.body, symbolize_names: true)
        expect(bookshelves_response).to be_an Array

        bookshelf = bookshelves_response.first
        expect(bookshelf).to have_key(:id)
        expect(bookshelf).to have_key(:title)
        expect(bookshelf).to have_key(:access)
        expect(bookshelf).to have_key(:book_count)
      end
    end
  end
  describe 'bookshelves show' do
    it 'returns bookshelf when provided with user id and shelf id'do
      VCR.use_cassette("Bookshelves_show_request", record: :new_episodes) do
        get '/api/v1/users/106196942824430802445/bookshelves/1001'

        expect(response).to be_successful

        bookshelf_response = JSON.parse(response.body, symbolize_names: true)
        expect(bookshelf_response).to be_a Hash
        expect(bookshelf_response).to have_key(:id)
        expect(bookshelf_response).to have_key(:title)
        expect(bookshelf_response).to have_key(:access)
        expect(bookshelf_response).to have_key(:book_count)
      end
    end
  end
  describe 'bookshelf books index' do
    it 'returns books from a given bookshelf'do
      VCR.use_cassette("Bookshelves_books_index_request", record: :new_episodes) do
        get '/api/v1/users/106196942824430802445/bookshelves/1001/books'
        expect(response).to be_successful

        bookshelf_books = JSON.parse(response.body, symbolize_names: true)
        expect(bookshelf_books).to be_an Array
        expect(bookshelf_books.first).to have_key(:id)
        expect(bookshelf_books.first).to have_key(:title)
        expect(bookshelf_books.first).to have_key(:subtitle)
        expect(bookshelf_books.first).to have_key(:authors)
        expect(bookshelf_books.first).to have_key(:publisher)
        expect(bookshelf_books.first).to have_key(:published_date)
        expect(bookshelf_books.first).to have_key(:description)
        expect(bookshelf_books.first).to have_key(:categories)
        expect(bookshelf_books.first).to have_key(:avg_rating)
        expect(bookshelf_books.first).to have_key(:image_links)
        expect(bookshelf_books.first).to have_key(:buy_link)
      end
    end
  end
end