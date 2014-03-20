class Bid < ActiveRecord::Base

  belongs_to :job
  
  validates :name, :email, :body, :bid_amount, :presence => {:message => 'cannot be empty'}
  
  validates :bid_amount, :numericality => true
  validate :job_should_be_published

  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i, :message => "email format isn't right"
  
  def job_should_be_published
    errors.add(:job_id, "is not published yet") if job && !job.published?
  end

end
