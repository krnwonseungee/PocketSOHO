Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, APP_CONFIG["GOOGLE_CLIENT_ID"], APP_CONFIG["GOOGLE_CLIENT_SECRET"]
end
