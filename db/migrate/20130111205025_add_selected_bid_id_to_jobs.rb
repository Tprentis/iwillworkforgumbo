class AddSelectedBidIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :selected_bid_id, :integer
  end
end
