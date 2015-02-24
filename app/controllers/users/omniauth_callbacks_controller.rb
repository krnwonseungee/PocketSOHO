class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # debugger

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    puts "*************************************************************"
    puts "MAKING REQUEST"
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.email == User.find_by_email_and_provider(@user.email, "linkedin")
      flash[:'alert-info'] = "An account has already been created under that email address."
      redirect_to root_path
    end

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def linkedin
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.email == User.find_by_email_and_provider(@user.email, "facebook")
      flash[:'alert-info'] = "An account has already been created under that email address."
      redirect_to root_path
    end

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Linkedin") if is_navigational_format?
    else
      session["devise.linkedin_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
