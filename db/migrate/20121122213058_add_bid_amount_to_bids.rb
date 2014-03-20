class AddBidAmountToBids < ActiveRecord::Migration
  def change
    add_column :bids, :bid_amount, :integer
  end
end
