class CreateBids < ActiveRecord::Migration[7.0]
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :auction_item_id
      t.decimal :amount
      t.datetime :bid_time

      t.timestamps
    end
  end
end
