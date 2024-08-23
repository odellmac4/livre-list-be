require 'rails_helper'

RSpec.describe Book do
  before(:each) do
    @book = Book.new(TestData.book_data)
  end
  test = 1
  it 'is a book' do
    expect(@book).to be_a Book
    expect(@book.id).to eq("S-JAtt8aHaUC")
    expect(@book.title).to eq("The Freedom Writers Diary (20th Anniversary Edition)")
    expect(@book.subtitle).to eq("How a Teacher and 150 Teens Used Writing to Change Themselves and the World Around Them")
    expect(@book.authors).to eq(["The Freedom Writers", "Erin Gruwell"])
    expect(@book.publisher).to eq("Crown")
    expect(@book.published_date).to eq("2007-04-24")
    expect(@book.description).to_not eq ("<p><b>Praised by fan favorites including Hoda Kotb, Kim & Khloe Kardashian, and Jimmy Fallon!</b></p><p><b>Inspired by the eagerly awaited birth of her daughter, Kaavia James Union Wade, <i>New York Times</i> bestselling author and award-winning actress Gabrielle Union pens a festive and universal love letter from parents to little ones, perfect for welcoming a baby to the party of life!</b></p><p>Reminiscent of favorites such as <i>The Wonderful Things You’ll Be</i> by Emily Winfield Martin, <i>I’ve Loved You Since Forever</i> by Hoda Kotb, and <i>Take Heart, My Child</i> by Ainsley Earhardt, <i>Welcome to the Party</i> is an upbeat celebration of new life that you’ll want to enjoy with your tiny guest of honor over and over again.</p><p> A great gift for all occasions, especially Mother’s Day, Father’s Day, baby showers, and birthdays.</p>")
    expect(@book.categories).to eq(["Education"])
    expect(@book.avg_rating).to eq(4.5)
    expect(@book.image_links).to be_a Hash
    expect(@book.buy_link).to eq("https://play.google.com/store/books/details?id=S-JAtt8aHaUC&rdid=book-S-JAtt8aHaUC&rdot=1&source=gbs_api")
  end
end