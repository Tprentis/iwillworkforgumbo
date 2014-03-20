class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :member_id
      t.string :name
      t.date :birthday
      t.text :bio
      t.string :twitter

      t.timestamps
    end
  end
end
