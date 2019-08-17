class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def index
    set_tweets
  end

  def new
    @tweet = Tweet.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    Tweet.create(tweet_params)
    set_tweets
    respond_tweet
  end

  def edit
    respond_tweet
  end

  def update
    @tweet.update(tweet_params)
    set_tweets
    respond_tweet
  end

  def destroy
    @tweet.destroy
    set_tweets
    respond_tweet
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def set_tweets
    @tweets = Tweet.order("created_at DESC").includes(:user)
  end

  def respond_tweet
    respond_to do |format|
      format.html
      format.js
    end
  end
end
