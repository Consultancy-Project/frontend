class Article
  attr_reader :headline,
              :url
  def initialize(data)
    @headline = data[:attributes][:headline]
    @url = data[:attributes][:url]
  end
end