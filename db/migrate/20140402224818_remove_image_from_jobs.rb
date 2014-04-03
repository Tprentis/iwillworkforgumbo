class RemoveImageFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :image_file_name, :string
    remove_column :jobs, :image_content_type, :string
    remove_column :jobs, :image_file_size, :integer
    remove_column :jobs, :image_updated_at, :datetime
  end
end
