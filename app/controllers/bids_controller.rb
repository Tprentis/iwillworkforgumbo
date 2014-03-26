class BidsController < ApplicationController
  before_filter :load_job, :except => :destroy
  before_filter :authenticate, :only => :destroy

  def create
    @bid = @job.bids.new(bid_params)
    if @bid.save
      respond_to do |format|
        @notice =
        format.html {redirect_to @job, :notice => 'Your bid is recorded and the job owner was emailed your bid. Thank you!'}
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @job, :alert => 'Unable to record your bid!'}
        format.js {render 'fail_create.js' }
      end
    end
  end

  def edit
    if @job.bids.where('bid_selected = ?', 1).empty?
      @bid = @job.bids.find(params[:id])
    else
      format.html { redirect_to @job, :alert => 'Unable to record your bid!  Another bid was already selected.' }
    end
  end

  def update
    @job = current_member.jobs.find(params[:job_id])
    @bid = @job.bids.find(params[:id])
    respond_to do |format|
      if @bid.update_attributes(bid_params)
        format.html { redirect_to @job, :notice => 'Bid was successfully accepted.' }
        format.json { head :no_content }
      end
    end
  end


  def destroy
    @job = current_member.jobs.find(params[:job_id])
    @bid = @job.bids.find(params[:id])
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to @job, :notice => 'Bid has been removed!'}
      format.js
    end
  end



  private
    def load_job
      @job = Job.find(params[:job_id])
    end

    def bid_params
      params.require(:bid).permit(:name, :email, :body, :bid_selected, :bid_per_rate, :bid_amount)
    end
end
