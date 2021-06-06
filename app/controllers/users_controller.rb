class UsersController < ApplicationController
  def dashboard
    @articles = BeFacade.get_news
    @tweets = BeFacade.get_tweets
  end
end