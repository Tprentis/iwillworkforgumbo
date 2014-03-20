class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    Notifier.comment_added(comment).deliver
  end

  def after_update(comment)
    Notifier.comment_accepted(comment).deliver
  end
end
