class MessagesController < ApplicationController

  def index
    @user = User.find_by_email(session[:email])
    @messages = @user.messages
  end

  def new
    @message = Message.new
  end

  def show
    @user = User.find_by_email(session[:email])
    @message = Message.find(params[:id])
    if @user.type == "BusinessOwner"
      @thread_messages = Message.where("business_owner_id = ? AND customer_id = ?", @user.id, @message.customer_id )
    else
      @thread_messages = Message.where("business_owner_id = ? AND customer_id = ?", @message.business_owner_id, @user.id )
    end
  end

  def create

  end

  def destroy

  end
end
