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
    if @user.type == "BusinessOwner" && @profile_user.type == "Customer"
      @conversation = Conversation.where( "business_owner_id = ? AND customer_id = ?", @user.id, @profile_user.id ).first
    else
      @conversation = Conversation.where( "business_owner_id = ? AND customer_id = ?", @profile_user.id, @user.id ).first
    end
  end

  def update
    @user = User.find(session[:user_id])
    user_params = params[:business_owner] || params[:customer]
    user_params.permit!
    @user.update( user_params )
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(session[:user_id])

  end

  def settings
    @user = User.find(session[:user_id])
    @businesses = Business.where("business_owner_id = ?", @user.id )
  end

  # private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :city, :state, :email, :image_url, :phone)
  # end
end
