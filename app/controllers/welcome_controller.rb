class WelcomeController < ApplicationController
  def index
    if session[:email]
      @user = User.find_by_email(session[:email])
      @businesses = Business.all #change to find_by_user_id
      render "home"
    else
      render "index"
    end
  end

  def settings
    @user = User.find_by_email(session[:email])
    @businesses = Business.all #change to find_by_user_id
  end
end
