class UsersController < ApplicationController

  def new

  end

  def create

  end

  def edit

  end

  def show
    @user = User.find(params[:id])
  end

  def update

  end

  def destroy

  end

  def settings
    @user = User.find(session[:user_id])
    @businesses = Business.where("business_owner_id = ?", @user.id )
  end
end
