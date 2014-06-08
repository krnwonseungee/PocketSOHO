class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User::BusinessOwner.find_by_email(params[:email]) || User::Customer.find_by_email(params[:email])
    session[:user_id] = @user.id
    redirect_to user_homepage_path
  end

  def destroy

  end
end
