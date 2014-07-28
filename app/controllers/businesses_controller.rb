class BusinessesController < ApplicationController
  def new
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
  end

  def show
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
    @biz_owner = User.find(@business.business_owner_id)
  end

  def update
    @user = User.find(session[:user_id])

  end

  def destroy
    @user = User.find(session[:user_id])
  end
end
