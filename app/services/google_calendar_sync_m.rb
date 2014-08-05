# require 'singleton'
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/file_storage'

module GoogleCalendarSyncM
  class GoogleCalendarSync
    # include Singleton

    attr_reader :calendar, :client

    CREDENTIAL_STORE_FILE = "/lib/client_secrets.json"

    def initialize(session)
      @session = session
      create_client
      create_file_storage
      create_calendar
    end

    def create_client
      @client = Google::APIClient.new(
      :application_name => 'PocketSOHO',
      :application_version => '0.0.1')
    end

    def create_file_storage
      @file_storage = Google::APIClient::FileStorage.new(CREDENTIAL_STORE_FILE)

      if @file_storage.authorization.nil?
        client_secrets = Google::APIClient::ClientSecrets.load
        @client.authorization = client_secrets.to_authorization
        @client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
      else
        @client.authorization = file_storage.authorization
      end
    end

    def create_calendar
      @calendar = @client.discovered_api('calendar', 'v3')
    end

    def user_credentials
      # Build a per-request oauth credential based on token stored in session
      # which allows us to use a shared API client.
      @authorization ||= (
        auth = @client.authorization.dup
        auth.redirect_uri = 'http://localhost:4567/oauth2callback'

        auth.update_token!(@session.to_hash)
        auth
      )
    end

  end
end
