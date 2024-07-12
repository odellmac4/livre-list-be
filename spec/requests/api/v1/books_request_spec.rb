require 'rails_helper'

RSpec.describe 'Books request', :vcr do
  describe 'books index' do
    it 'returns books based on a keyword'do
      VCR.use_cassette("Books_request", record: :new_episodes) do
        get '/api/v1/books?search=verity'

        expect(response).to be_successful

        books_response = JSON.parse(response.body, symbolize_names: true)
        expect(books_response).to be_an Array

        book = books_response.first
        expect(book).to have_key(:id)
        expect(book).to have_key(:title)
        expect(book).to have_key(:subtitle)
        expect(book).to have_key(:authors)
        expect(book).to have_key(:publisher)
        expect(book).to have_key(:published_date)
        expect(book).to have_key(:description)
        expect(book).to have_key(:categories)
        expect(book).to have_key(:avg_rating)
        expect(book).to have_key(:image_links)
        expect(book).to have_key(:buy_link)
      end
    end
  end
end