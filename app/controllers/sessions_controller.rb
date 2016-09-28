class SessionsController < ApplicationController
  skip_before_action :ensure_signin, only: [:new, :create]
  
  def new
  end

  def create
    password = ENV['PASSWORD'] ? ENV['PASSWORD'] : '123456'
      
    if params[:password] == password
      session[:uid] = 1
  	  redirect_to root_path, notice: "Signed in successfully"
    else
      redirect_to signin_path, alert: "Invalid password"
    end
  end

  def destroy
    reset_session
    redirect_to signin_path, notice: "You have been signed out"
  end
end
