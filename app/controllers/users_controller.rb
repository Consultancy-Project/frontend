class UsersController < ApplicationController
  def dashboard
    @articles = BeService.recent_news
    @tweets = BeService.recent_tweets
  end
end