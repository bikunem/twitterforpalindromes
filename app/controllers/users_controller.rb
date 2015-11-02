class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Twitter for Palindromes"
      redirect_to @user
    else
      render 'new'
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
