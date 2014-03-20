class CommentsController < ApplicationController
  before_filter :load_commentable
  respond_to :html

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if !@comment.content.blank?
      @comment.created_by_member = current_member.id
      if @comment.save
        redirect_to @commentable, notice: "New Stuff Was Posted."
      else
        render :new
      end
    else
      redirect_to @commentable, notice: "The stuff you said was empty! Sorry, we don't save empty stuff......"
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @comment = @job.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @job, :notice => 'Comment has been removed!'}
      format.js
    end
  end


  private

  def comment_params
    params.
      require(:comment).
      permit(:content)
  end

  def load_commentable
    resource, id = request.path.split('/')[1,2] # /jobs/1 etc.
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  # alternative option:
  # def load_commentable
  #   klass = [Job, Member].detect { |c| params["#{c.name.underscore}_id"] }
  #   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  # end

end
