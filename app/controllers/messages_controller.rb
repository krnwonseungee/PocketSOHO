class MessagesController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @messages = @user.messages
  end

  def new
  end

  def show
    @user = User.find(session[:user_id])
    @new_message = Message.new
    @message = Message.find(params[:id])
    if @user.type == "BusinessOwner"
      @conversation_messages = Message.where("business_owner_id = ? AND customer_id = ?", @user.id, @message.customer_id )
    else
      @conversation_messages = Message.where("business_owner_id = ? AND customer_id = ?", @message.business_owner_id, @user.id )
    end
  end

  def create
    @user = User.find(session[:user_id])
    if @user.type == "BusinessOwner"
      Message.create( text: params[:message][:text], customer_id: 2, business_owner_id: @user.id )
    else
      Message.create( text: params[:message][:text], customer_id: @user.id, business_owner_id: 1 )
    end
    redirect_to user_messages_path(@user.id)
  end

  def destroy

  end
end
