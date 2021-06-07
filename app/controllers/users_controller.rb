class UsersController < ApplicationController
  def dashboard; end
  
  def news
    @articles = BeFacade.get_news
  end
  
  def tweets
    @tweets = BeFacade.get_tweets
  end
end