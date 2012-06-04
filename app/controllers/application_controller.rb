class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery
  
  helper_method :current_user
  
  @page_title = "Welcome to Ecoweb"
  
private

  def authenticate
    unless current_user
      redirect_to login_url, :notice => "In order to enter or change data, please log in."
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "In order to enter or change data, please log in."
    end
  end
  
end
