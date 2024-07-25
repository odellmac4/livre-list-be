class BooksService
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