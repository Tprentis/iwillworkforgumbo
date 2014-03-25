class AddImageToJobs < ActiveRecord::Migration
  def change
    add_attachment :jobs, :image
  end
end
