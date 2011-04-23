class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      sign_in @user
      redirect_to @user, :notice => t('user.flash.registration')
    else
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
  end
end
