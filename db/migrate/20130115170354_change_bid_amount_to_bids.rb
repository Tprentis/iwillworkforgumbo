class ChangeBidAmountToBids < ActiveRecord::Migration
  def up
    remove_column :bids, :bid_amount
    add_column :bids, :bid_amount, :decimal
  end

  def down
    remove_column :bids, :bid_amount
    add_column :bids, :bid_amount, :integer
  end
end
