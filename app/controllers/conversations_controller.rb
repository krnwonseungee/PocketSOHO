class ConversationsController < ApplicationController
  before_filter :set_user

  def index
    @recent_conversations = Array.new
    @new_message = Message.new
    if @user.type == "BusinessOwner"
        # @recipient_list = Customer.where( business_id: Business.where( "business_owner_id = ? ", @user.id).pluck(:id) ).pluck(:first_name)
        Conversation.where("business_owner_id = ?", @user.id ).each do |thread|
        @recent_conversations << thread.messages.last
      end

    else
      # @recipient_list = BusinessOwner.where( business_id: @user.business_id ).pluck(:first_name) #FIX SO BUSINESS2 SHOWS
      Conversation.where("customer_id = ?", @user.id ).each do |thread|
        @recent_conversations << thread.messages.last
      end
    end
      @recent_conversations.sort_by!{ |msg| msg.updated_at }.reverse!

      respond_to do |format|
        format.html
        format.any(:json) { render request.format.to_sym => @recent_conversations }
      end
  end

  def new
    @new_message = Message.new
    @recipient_list = {}
    @business_id = @user.business_id
    if @user.type == "BusinessOwner"
      recipient_first_names = Customer.where( "business_id =?", @business_id ).pluck(:first_name)
      recipient_last_names = Customer.where( "business_id =?", @business_id ).pluck(:last_name)
      recipient_first_names.each_with_index do |val, i|
        full_name = recipient_first_names[i] + " " + recipient_last_names[i]
        @recipient_list[ full_name ] = Customer.where( "business_id =?", @business_id )[i]
      end
    end
  end

  def create
    puts "CREATE!! #{params}"
    puts "SESSION IN CREATE!! #{session[:conversation_id]}"
    @current_business = Business.find_by_business_owner_id(@user.id)
    # creating message from CONVERSATIONS#NEW
    if params[:message][:customer_id]
      customer_name = params[:message][:customer_id].split(" ")
      @recipient_customer = Customer.find_by_first_name_and_last_name(customer_name[0], customer_name[1])
      if @user.type == "BusinessOwner"
        @new_message = Message.create(text: params[:message][:text], business_owner_id: @user.id, customer_id: @recipient_customer.id, business_id: @current_business.id, sender_id: @user.id)
        @new_message.conversation.update( seen_by_customer: false )
        redirect_to user_conversation_path( @user.id, @new_message.conversation.id )
      else
        #TENTATIVE (if customer is creating new conversation w/biz owner)
      end
    # creating message from CONVERSATIONS#SHOW
    else
      @current_conversation = Conversation.find(session[:conversation_id])
      @new_message = Message.create( text: params[:message][:text], customer_id: @current_conversation.customer_id, business_owner_id: @current_conversation.business_owner_id, sender_id: @user.id )
      @new_message.conversation.update( seen_by_customer: false )
      redirect_to user_conversation_path( @user.id, session[:conversation_id] )
    end
  end

  def show
    puts "SHOW!! #{params}"
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

  def destroy

  end

  def results
    puts "SEARCHBAR PARAMS #{params}"
    business_owner_id = BusinessOwner.where( "first_name = ? OR last_name = ?", params[:search_term].camelize, params[:search_term].camelize )
    customer_id = params[:search_term]
    Conversation.where( "business_owner_id = ? OR customer_id", business_owner_id, customer_id )
    render :json => MessageSearcher.new.retrieve_relevant_messages(params["search_term"])
  end

  private

  def set_user
    @user = current_user
  end
end
