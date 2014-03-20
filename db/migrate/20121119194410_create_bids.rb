class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :job_id
      t.string :name
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
