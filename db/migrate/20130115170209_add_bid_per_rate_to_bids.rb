class AddBidPerRateToBids < ActiveRecord::Migration
  def change
    add_column :bids, :bid_per_rate, :string
  end
end
