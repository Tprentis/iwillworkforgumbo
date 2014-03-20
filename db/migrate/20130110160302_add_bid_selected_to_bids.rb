class AddBidSelectedToBids < ActiveRecord::Migration
  def change
    add_column :bids, :bid_selected, :boolean
  end
end
