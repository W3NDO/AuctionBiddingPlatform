class AddAuctioneerAndBidderFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auctioneer, :integer, :default => 1 # default is false
    add_column :users, :bidder, :integer, :default => 0 # default is true
  end
end
