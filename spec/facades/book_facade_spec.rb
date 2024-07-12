require 'rails_helper'

RSpec.describe BookFacade, :vcr do
  before(:each) do
    @facade = BookFacade.book_search("freedom writers")
    
  end

  it 'creates book poros from response' do
    expect(@facade).to be_an Array
    expect(@facade.first).to be_a Book
  end
end