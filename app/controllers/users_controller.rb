# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  def show
    @user = User.find(params[:id])
    @meetings = @user.meetings
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the app!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
