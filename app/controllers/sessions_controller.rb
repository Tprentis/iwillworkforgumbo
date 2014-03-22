class SessionsController < ApplicationController

  def create
    if member = Member.authenticate(params[:email].downcase, params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = member.auth_token
      else
        cookies[:auth_token] = member.auth_token
      end
      redirect_to jobs_path, :notice => "You are now logged in."
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end

  def destroy
#    reset_session
    cookies.delete(:auth_token)
    redirect_to jobs_path, :notice => "You are now logged out."
  end

end
