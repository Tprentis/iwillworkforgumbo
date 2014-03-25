class JobsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show, :notify_friend, :filter, :search]

  def search
    self.limit
    render :action => 'index'
  end

  # GET /jobs
  # GET /jobs.json
  def index
    self.limit
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])
    @commentable = @job
    @comments = @commentable.comments
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = current_member.jobs.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = current_member.jobs.new(job_params)
    @job.published_at = DateTime.now
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'The stuff you want done was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = current_member.jobs.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(job_params)
        format.html { redirect_to @job, notice: 'The stuff you want done was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = current_member.jobs.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end

  def notify_friend
    @job = Job.find(params[:id])
    if (params[:name].size > 0 && params[:email].size > 0) and (valid_email?(params[:email]))
      Notifier.email_friend(@job, params[:name], params[:email]).deliver
      redirect_to @job, :notice => "Successfully sent this stuff to your friend"
    else
      redirect_to @job, :notice => 'Both Friend Name and Email Address Must be Present and Formatted Correctly in order to Send Email to a Friend! Try Again.'
    end
  end


  def limit
    search_condition = "%" + params[:keyword].to_s + "%"
    search_cat = params[:category].to_i
    search_keyword = params[:keyword].to_s

    if search_cat == 0

      if search_keyword > ""
        @jobs = Job.where('UPPER(title) LIKE UPPER(?) OR UPPER(body) LIKE UPPER(?) OR UPPER(excerpt) LIKE UPPER(?) OR UPPER(location) LIKE UPPER(?)', search_condition, search_condition, search_condition, search_condition)
        @jobs.order(updated_at: :desc)
        @jobs = Kaminari.paginate_array(@jobs).page(params[:page]).per(4)
      else
        @jobs = Job.order('updated_at DESC').page(params[:page]).per(4)
      end
    else
      @cat = Category.find(search_cat.to_i)
      @jobs = @cat.jobs.where('UPPER(title) LIKE UPPER(?) OR UPPER(body) LIKE UPPER(?) OR UPPER(excerpt) LIKE UPPER(?) OR UPPER(location) LIKE UPPER(?)', search_condition, search_condition, search_condition, search_condition)
      @jobs.order(updated_at: :desc)
      @jobs = Kaminari.paginate_array(@jobs).page(params[:page]).per(4)
    end

  end

private
  def valid_email?(email)
    email.present? &&
     (email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def job_params
    params.require(:job).permit(:title, :body, :excerpt, :location, :categories, {:category_ids => []}, :image, :image_file_name)
  end

end
