require 'rails_helper'

RSpec.describe Book do
  before(:each) do
    @book = Book.new(TestData.book_data)
  end

  it 'is a book' do
    expect(@book).to be_a Book
    expect(@book.id).to eq("S-JAtt8aHaUC")
    expect(@book.title).to eq("The Freedom Writers Diary (20th Anniversary Edition)")
    expect(@book.subtitle).to eq("How a Teacher and 150 Teens Used Writing to Change Themselves and the World Around Them")
    expect(@book.authors).to eq(["The Freedom Writers", "Erin Gruwell"])
    expect(@book.publisher).to eq("Crown")
    expect(@book.published_date).to eq("2007-04-24")
    expect(@book.description.include?("#1 NEW YORK TIMES BESTSELLER")).to eq true
    expect(@book.categories).to eq(["Education"])
    expect(@book.avg_rating).to eq(4.5)
    expect(@book.image_links).to be_a Hash
    expect(@book.buy_link).to eq("https://play.google.com/store/books/details?id=S-JAtt8aHaUC&rdid=book-S-JAtt8aHaUC&rdot=1&source=gbs_api")
  end
end