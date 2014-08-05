class GoogleCalendarsController < ApplicationController
  before_filter :create_client
  before_filter :ensure_oauth_authorization!
  after_filter :serialize_token

  include GoogleCalendarSyncM

  # include GoogleCalendarSyncM
  # Request authorization
  def oauth2authorize
    redirect_to user_credentials.authorization_uri.to_s, status: 303
  end

  # Exchange token
  def oauth2callback
    user_credentials.code = params[:code] if params[:code]
    user_credentials.fetch_access_token!
    redirect_to '/calendar_final'
  end

  def final
    client = @google_client.client
    add_event(client)
  end

  def list_events(client)
        @response = client.execute(:api_method => calendar.events.list,
                                :parameters => {'calendarId' => 'primary'},
                                :authorization => user_credentials).data.to_json
  end

  def add_event(client)
    @response = client.execute(:api_method => calendar.events.quick_add,
                              :parameters => {
                                'calendarId' => 'janetyi90@gmail.com',
                                'text' => "test event3",
                                'sendNotifications' => false,
                                'start' => DateTime.now,
                                'end' => DateTime.now + 2.day
                                },
                              :authorization => user_credentials).data.to_json
  end

  private

  def calendar
    @google_client.calendar
  end

  def create_client
    @google_client = GoogleCalendarSync.new session
  end


  def user_credentials
    @google_client.user_credentials
  end

  def ensure_oauth_authorization!
    # Ensure user has authorized the app
    unless user_credentials.access_token || request.path_info =~ /\A\/oauth2/
      redirect_to '/oauth2authorize'
    end
  end

  def serialize_token
    session[:access_token] = user_credentials.access_token
    session[:refresh_token] = user_credentials.refresh_token
    session[:expires_in] = user_credentials.expires_in
    session[:issued_at] = user_credentials.issued_at

    file_storage = Google::APIClient::FileStorage.new("/lib/client_secrets.json")
    file_storage.write_credentials(user_credentials)
  end

end
