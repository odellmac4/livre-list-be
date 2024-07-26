class BooksService
  
  def bookshelf(data)
    if data[:books]
      get_url("/books/v1/users/#{data[:uid]}/bookshelves/#{data[:shelf_id]}/volumes")
    else
      get_url("/books/v1/users/#{data[:uid]}/bookshelves/#{data[:shelf_id]}")
    end
  end
  
  def bookshelves(uid)
    get_url("/books/v1/users/#{uid}/bookshelves")
  end
  
  def volume(id)
    get_url("/books/v1/volumes/#{id}")
  end

  def volumes(keyword)
    get_url("/books/v1/volumes?q=#{keyword}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://www.googleapis.com") do |faraday|
      faraday.params[:key] = ENV['GOOGLE_API_KEY']
    end
  end
end