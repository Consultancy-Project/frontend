class Tweet
  attr_reader :tweet,
              :username

  def initialize(data)
    @tweet = data[:attributes][:tweet]
    @username = data[:attributes][:username]
  end
end