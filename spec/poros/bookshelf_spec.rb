require 'rails_helper'

RSpec.describe Bookshelf do
  before(:each) do
    @bookshelf = Bookshelf.new(TestData.shelves_data)
  end

  it 'is a bookshelf' do
    expect(@bookshelf.id).to eq 0
    expect(@bookshelf.title).to eq "Favorites"
    expect(@bookshelf.access).to eq "PUBLIC"
    expect(@bookshelf.book_count).to eq 0
  end
end