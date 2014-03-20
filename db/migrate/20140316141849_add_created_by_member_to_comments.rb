class AddCreatedByMemberToComments < ActiveRecord::Migration
  def change
    add_column :comments, :created_by_member, :integer
  end
end
