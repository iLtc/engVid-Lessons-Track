class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :ensure_signin
  helper_method :signed_in?

  protected
    def ensure_signin
      # Always go to login page unless session contains
      # reviewer_id
      redirect_to signin_path, alert: "Sign In First!" unless session[:uid]
    end

    def signed_in?
      session[:uid] # nil is false
    end
end
