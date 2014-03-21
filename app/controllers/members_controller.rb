class MembersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to jobs_path, :notice => 'Member successfully created.'
    else
      render :action => 'new'
    end
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update_attributes(member_params)
      redirect_to jobs_path, :notice => 'Updated member information successfully'
    else
      render :action => 'edit'
    end
  end

private
  def member_params
    params.require(:member).permit(:email, :password, :password_confirmation, :password_reset_token)
  end
end
