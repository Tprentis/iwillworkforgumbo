class AddExcerptAndLocationToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :excerpt, :string
    add_column :jobs, :location, :string
  end
end
