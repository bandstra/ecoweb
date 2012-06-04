class SessionsController < ApplicationController
  skip_before_filter :authorize
     
  def new
  end
  
  def create
    # see user.rb and application_controller.rb
    user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, :notice => "Logged in!"
      else
        flash.now[:alert] = "Invalid email or password!"
        render :new
      end
  end
  
  def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out!"
  end
end
