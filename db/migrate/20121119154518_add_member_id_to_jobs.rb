class AddMemberIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :member_id, :integer
  end
end
