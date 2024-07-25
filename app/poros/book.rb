class Book
  attr_reader :id,
              :title,
              :subtitle,
              :authors,
              :publisher,
              :published_date,
              :description,
              :categories,
              :avg_rating,
              :image_links,
              :buy_link

  def initialize(book_data)
    @id = book_data[:id]
    @title = book_data[:volumeInfo][:title]
    @subtitle = book_data[:volumeInfo][:subtitle]
    @authors = book_data[:volumeInfo][:authors]
    @publisher = book_data[:volumeInfo][:publisher]
    @published_date = book_data[:volumeInfo][:publishedDate]
    @description = format_description(book_data[:volumeInfo][:description])
    @categories = book_data[:volumeInfo][:categories]
    @avg_rating = book_data[:volumeInfo][:averageRating]
    @image_links = book_data[:volumeInfo][:imageLinks]
    @buy_link = book_data[:saleInfo][:buyLink]
  end

  def format_description(description_data)
    if description_data.include?("<") || description_data.include?(">") || description_data.include?("/")
      Nokogiri::HTML(description_data).text.strip
    else
      description_data
    end
  end
end