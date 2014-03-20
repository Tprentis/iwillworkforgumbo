class ChangeBidSelectedToInteger < ActiveRecord::Migration
  def up
    remove_column :bids, :bid_selected  
    add_column :bids, :bid_selected, :integer
  end

  def down
    remove_column :bids, :bid_selected  
    add_column :bids, :bid_selected, :boolean
  end
end
