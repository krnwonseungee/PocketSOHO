class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
