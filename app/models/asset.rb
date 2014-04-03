class Asset < ActiveRecord::Base
  belongs_to :job

   has_attached_file :image,
                    :styles => { :medium => "600X600>", :thumbnail => "75x75#"},
                    :default_url => "/images/:style/missing.gif"
   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
