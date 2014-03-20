class RenamePasswordToHashedPassword < ActiveRecord::Migration
  def up
    rename_column :members, :password, :hashed_password
  end

  def down
    rename_column :members, :hashed_password, :password
  end
end
