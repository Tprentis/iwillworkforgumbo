class Job < ActiveRecord::Base

  validates :title, :presence => true
  validates :body, :presence => {:message => "Stuff to be done - cannot be blank!"}

  belongs_to :member

  has_and_belongs_to_many :categories

  has_many :bids, :dependent => :destroy
  has_many :comments, as: :commentable
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, allow_destroy: true

  after_update :save_assets
#  acts_as_taggable


  scope :published, where("jobs.published_at IS NOT NULL")
  scope :draft, where("jobs.published_at IS NULL")
  scope :recent, lambda { published.where("jobs.published_at > ?", 1.week.ago.to_date) }
  scope :where_title, lambda { |term| where("jobs.title LIKE ?", "%#{term}%")}

  def new_asset_attributes=(asset_attributes)
    asset_attributes.each do |attributes|
      assets.build(attributes)
    end
  end

  def existing_asset_attributes=(asset_attributes)
    assets.reject(&:new_record?).each do |asset|
      attributes = asset_attributes[asset.id.to_s]
      if attributes
        asset.attributes = attributes
      else
        asset.delete(asset)
      end
    end
  end

  def save_assets
    assets.each do |asset|
      asset.save(:validate => false)
    end
  end

  def long_title
    "#{title} - #{published_at}"
  end

  def published?
    published_at.present?
  end

  def owned_by?(owner)
    return false unless owner.is_a? Member
    member == owner
  end

end
