class Article
  attr_reader :headline,
              :url,
              :image,
              :summary
              
  def initialize(data)
    @headline = data[:attributes][:headline]
    @url = data[:attributes][:url]
    @image = data[:attributes][:image]
    @summary = data[:attributes][:summary]
  end
end