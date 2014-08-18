class UsersController < ApplicationController
  before_filter :set_user

  def new
    @new_customer = @user.businesses.first.customers.new
  end

  def create
    @new_customer = @user.businesses.first.customers.create(params[:customer])
    redirect_to root_path
  end

  def edit
  end

  def show
    @profile_user = User.find(params[:id])
    if @user.type == "BusinessOwner" && @profile_user.type == "Customer"
      @conversation = Conversation.where( "business_owner_id = ? AND customer_id = ?", @user.id, @profile_user.id ).first
    else
      @conversation = Conversation.where( "business_owner_id = ? AND customer_id = ?", @profile_user.id, @user.id ).first
    end
  end

  def update

    user_params = params[@user.class.name.underscore.downcase.to_sym]
    user_params.permit!
    @user.update( user_params )
    redirect_to user_path(@user)
  end

  def destroy

  end

  def settings
    @businesses = Business.where("business_owner_id = ?", @user.id )
  end

  private

  def set_user
    @user = current_user
  end

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :city, :state, :email, :image_url, :phone)
  # end
end
