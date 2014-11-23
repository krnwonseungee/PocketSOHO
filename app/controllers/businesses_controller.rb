class BusinessesController < ApplicationController
  before_filter :set_user

  def new
    if @user.type == "Customer"
        redirect_to appointments_path
        flash[:error] = 'You must be a Business Owner to access this page.'
    end
    @new_business = Business.new(business_owner_id: current_user.id)
  end

  def create
    @new_business = Business.create(business_params)
    @new_business.update( business_owner_id: @user.id )
    current_user.update(business_id: @new_business.id)
    redirect_to root_path
  end

  def edit
    if @user.type == "Customer"
        redirect_to appointments_path
        flash[:error] = 'You must be a Business Owner to access this page.'
    end
    @business = Business.find(params[:id])
  end

  def show
    @business = Business.find(params[:id])
    @biz_owner = User.find(@business.business_owner_id)
    if @user.type == "Customer"
      @conversation = Conversation.find_by_customer_id_and_business_owner_id( @user.id, @biz_owner.id )
    end
  end

  def update
    @business = Business.find(params[:id])
    @business.update( business_params )
    redirect_to root_path
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
  end

  private

  def business_params
    params.require(:business).permit(:name, :location, :slogan, :image_url, :city, :state, :description)
  end
end
