class TweetsController < ApplicationController
  before_action :require_twitter_login

  def new
  end

  def create
    current_user.tweet(twitter_params[:message])
  end

  private

  def twitter_params
    params.require(:tweet).permit(:message)
  end

  def require_twitter_login
    unless current_twitter_user
      flash[:notice] = "You must be logged in with twitter to tweet."
      redirect_to login_path
    end
  end
end
