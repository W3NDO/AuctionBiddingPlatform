class AddPriceCentsToAuctionItemAndBids < ActiveRecord::Migration[7.0]
  def change
    add_column :auction_items, :currency, :string, default: 'EUR', null: false
    add_column :bids, :currency, :string, default: 'EUR', null: false
  end
end
