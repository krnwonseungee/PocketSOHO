class ConversationsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @recent_conversations = Array.new
    if @user.type == "BusinessOwner"
      Conversation.where("business_owner_id = ?", @user.id ).each do |thread|
        @recent_conversations << thread.messages.last
      end
    else
      Conversation.where("customer_id = ?", @user.id ).each do |thread|
        @recent_conversations << thread.messages.last
      end
    end
      @recent_conversations.sort_by!{ |msg| msg.updated_at }.reverse!
  end

  def new
  end

  def show
    puts "SHOW PARAMS!! #{params}"
    @user = User.find(session[:user_id])
    @new_message = Message.new
    @conversation = Conversation.find(params[:id])
    if @user.type == "BusinessOwner"
      @conversation_messages = Conversation.where("business_owner_id = ? AND customer_id = ?", @user.id, @conversation.customer_id ).first.messages
    else
      @conversation_messages = Conversation.where("business_owner_id = ? AND customer_id = ?", @conversation.business_owner_id, @user.id ).first.messages
    end
    session[:conversation_id] = @conversation.id
  end

  def create
    @user = User.find(session[:user_id])
    @current_conversation = Conversation.find(session[:conversation_id])
    puts "CREATE PARAMS!! #{params}"
    puts "SESSION MESSAGE ID!! #{session[:conversation_id]}"
    Message.create( text: params[:message][:text], customer_id: @current_conversation.customer_id, business_owner_id: @current_conversation.business_owner_id )
    redirect_to user_conversation_path( @user.id, session[:conversation_id] )
  end

  def destroy

  end
end
