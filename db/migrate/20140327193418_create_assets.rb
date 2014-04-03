class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :job, index: true
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"
      t.datetime "image_updated_at"
      t.timestamps
    end
  end
end
