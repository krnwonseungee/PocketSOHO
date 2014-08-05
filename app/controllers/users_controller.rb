class UsersController < ApplicationController

  def new
    @user = User.find(session[:user_id])
  end

  def create

  end

  def edit
    @user = User.find(session[:user_id])

  end

  def show
    @user = User.find(session[:user_id])
    @profile_user = User.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])


  end

  def destroy
    @user = User.find(session[:user_id])

  end

  def settings
    @user = User.find(session[:user_id])
    @businesses = Business.where("business_owner_id = ?", @user.id )
  end
end
