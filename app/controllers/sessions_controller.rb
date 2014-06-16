class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_email(session[:email])
    session[:user_id] = @user.id
    session[:email] = params[:email]
    redirect_to root_path
  end

  def destroy
    redirect_to new_session_path
  end
end
