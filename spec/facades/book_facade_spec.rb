require 'rails_helper'

RSpec.describe BookFacade, :vcr do
  before(:each) do
    @facade = BookFacade.book_search("freedom writers")
    @book = BookFacade.book_by_id("AbyoDwAAQBAJ")
    
  end

  it 'creates book poros from response' do
    VCR.use_cassette("Book_facade/index_page", record: :new_episodes) do
      expect(@facade).to be_an Array
      expect(@facade.first).to be_a Book
    end
  end

  it 'creates a book poro with an id' do
    VCR.use_cassette("Book_facade/show_page", record: :new_episodes) do
      expect(@book).to be_a Book
    end
  end

end