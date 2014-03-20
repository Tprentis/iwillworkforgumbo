class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery


#  def current_member
#    return unless session[:member_id]
#    @current_member ||= Member.where(:id => session[:member_id])
#  end

  def authenticate
    logged_in? ? true : access_denied
  end

  def logged_in?
    current_member.is_a? Member
  end

  helper_method :logged_in?

  def access_denied
    redirect_to login_path, :notice => "Please log in to continue" and return false
  end

 private

  def current_member
    @current_member ||= Member.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_member

  def mobile_device?
      request.user_agent =~ /Mobile|webOS/
  end
  helper_method :mobile_device?


end
