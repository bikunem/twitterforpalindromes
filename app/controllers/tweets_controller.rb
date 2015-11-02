class TweetsController < ApplicationController
  before_action :logged_in_user

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:success] = "Palindrome added!"
      redirect_to root_path
    else
      @feed_items = []
      render 'welcome/index'
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:status)
    end

end
