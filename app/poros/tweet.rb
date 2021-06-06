class Tweet
  attr_reader :tweet

  def initialize(data)
    @tweet = data[:attributes][:tweet]
  end
end