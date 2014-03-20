class CreateCategoriesJobs < ActiveRecord::Migration
  def up
    create_table :categories_jobs, :id => false do |t|
      t.references :job
      t.references :category
    end
  end

  def down
    drop_table :categories_jobs
  end
end
