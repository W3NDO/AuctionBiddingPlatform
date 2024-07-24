class AddAuctioneerAndBidderFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auctioneer, :boolean, :default => false 
    add_column :users, :bidder, :boolean, :default => true
  end
end
