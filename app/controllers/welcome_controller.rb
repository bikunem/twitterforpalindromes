class WelcomeController < ApplicationController

  def index
    if logged_in?
      @tweet = current_user.tweets.build
      @feed_items = current_user.feed
    end
  end

end
