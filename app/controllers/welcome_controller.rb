class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
      @businesses = Business.all #change to find_by_user_id
      @unread_conversations = Array.new

      if @user.type == "BusinessOwner"
        Conversation.where("business_owner_id = ? AND seen_by_business_owner = ?", @user.id, false ).each do |thread|
          @unread_conversations << thread.messages.last
        end
        @appointments = Appointment.where( "business_owner_id = ?", @user.id )

      else
        Conversation.where("customer_id = ? AND seen_by_customer = ?", @user.id, false ).each do |thread|
          @unread_conversations << thread.messages.last
        end
        @appointments = Appointment.where( "customer_id = ?", @user.id )
      end
      @unread_conversations.sort_by!{ |msg| msg.updated_at }.reverse!
      render "home"
    else
      render "info"
    end
  end

  def settings
    @user = User.find(session[:user_id])
    @businesses = Business.all #change to find_by_user_id
  end
end
