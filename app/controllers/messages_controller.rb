class MessagesController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @recent_conversations = Array.new
    Conversation.where("business_owner_id = ?", @user.id ).each do |thread|
      @recent_conversations << thread.messages.last
    end
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
    print Message.last
    Message.create( text: params[:message][:text], customer_id: Message.last.customer_id, business_owner_id: Message.last.business_owner_id )
    redirect_to user_message_path( @user.id, Message.last.id )
  end

  def destroy

  end
end
