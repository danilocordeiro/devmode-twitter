class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to '', notice: 'Tweet created!'
    else
      redirect_to '', notice: 'Error to create tweet!'
    end
  end
  
  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
  
end