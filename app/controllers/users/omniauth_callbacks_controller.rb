class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)
    unless @user.persisted?
      @user.save
    end

    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
  end
end
