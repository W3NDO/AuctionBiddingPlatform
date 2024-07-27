class ChangeAuctionAndBidPriceToCurrency < ActiveRecord::Migration[7.0]
  def change
    rename_column :auction_items, :starting_price, :starting_price_cents
    rename_column :bids, :amount, :amount_cents

    change_column :auction_items, :starting_price_cents, :decimal, precision: 10, scale: 2, default: 0, null: false
    change_column :bids, :amount_cents, :decimal, precision: 10, scale: 2, default: 0, null: false
  end
end
