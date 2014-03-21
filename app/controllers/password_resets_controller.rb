class PasswordResetsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by_email(params[:email])
    member.send_password_reset if member
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end

  def edit
    @member = Member.find_by_password_reset_token!(params[:id])
  end

  def update
    @member = Member.find_by_password_reset_token!(params[:id])

    if @member.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @member.update_attributes(params[:member])
      redirect_to root_url, :notice => "Password has been reset."
    else
      render :edit
    end

  end

private
  def password_reset_params
    params.require(:password_reset).permit(:email, :password, :password_confirmation, :password_reset_token)
  end
end
