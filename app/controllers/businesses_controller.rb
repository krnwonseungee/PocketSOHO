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
    if @user.type == "Customer"
      @conversation = Conversation.find_by_customer_id_and_business_owner_id( @user.id, @biz_owner.id )
    end
  end

  def update
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
    @business.update( business_params )
    redirect_to root_path
  end

  def destroy
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
    @business.destroy
  end

  private

  def business_params
    params.require(:business).permit(:name, :location, :slogan, :image_url, :city, :state, :description)
  end
end
