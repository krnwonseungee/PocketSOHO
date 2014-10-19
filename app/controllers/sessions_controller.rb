class SessionsController < ApplicationController
  def create
    session[:access_token] = request.env['omniauth.auth']['credentials']['token']
    session[:access_token_secret] = request.env['omniauth.auth']['credentials']['secret']
  end
end
