class CreateCategoryJobs < ActiveRecord::Migration
  def change
    create_table :category_jobs do |t|

      t.timestamps
    end
  end
end
