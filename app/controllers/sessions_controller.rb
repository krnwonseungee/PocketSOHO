class SessionsController < ApplicationController
  def create
    session[:access_token] = request.env['omniauth.auth']['credentials']['token']
    session[:access_token_secret] = request.env['omniauth.auth']['credentials']['secret']
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  def redirect
    redirect_to root_path
  end
end
