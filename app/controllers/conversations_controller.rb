class ConversationsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @recent_conversations = Array.new
    @new_message = Message.new
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
    puts "USER ID #{@user.id}"
    @new_thread_msg = Message.new
    @conversation = Conversation.find(params[:id])
    if @user.type == "BusinessOwner"
      @recipient_user = Customer.find(@conversation.customer_id)
      @recipient_name = "#{@recipient_user.first_name} #{@recipient_user.last_name}"
      @conversation_messages = Conversation.where("business_owner_id = ? AND customer_id = ?", @user.id, @conversation.customer_id ).first.messages
      @conversation.update( seen_by_business_owner: true )
    else
      @recipient_user = BusinessOwner.find(@conversation.business_owner_id)
      @recipient_name = "#{@recipient_user.first_name} #{@recipient_user.last_name}"
      @conversation_messages = Conversation.where("business_owner_id = ? AND customer_id = ?", @conversation.business_owner_id, @user.id ).first.messages
      @conversation.update( seen_by_customer: true )
    end
    session[:conversation_id] = @conversation.id
  end

  def create
    @user = User.find(session[:user_id])
    @current_conversation = Conversation.find(session[:conversation_id])
    @new_message = Message.create( text: params[:message][:text], customer_id: @current_conversation.customer_id, business_owner_id: @current_conversation.business_owner_id, sender_id: @user.id )
    if @user.type == "BusinessOwner"
      @new_message.conversation.update( seen_by_customer: false )
    else
      @new_message.conversation.update( seen_by_business_owner: false )
    end
    redirect_to user_conversation_path( @user.id, session[:conversation_id] )
  end

  def destroy

  end

  def results
    puts "SEARCHBAR PARAMS #{params}"
    render :json => MessageSearcher.new.retrieve_relevant_messages(params["search_term"])
  end
end
