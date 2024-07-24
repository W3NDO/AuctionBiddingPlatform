class CreateAuctionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :auction_items do |t|
      t.string :name
      t.text :description
      t.decimal :starting_price
      t.datetime :end_date
      t.decimal :current_bid
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
