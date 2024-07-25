class AddUserIdToAuctionItem < ActiveRecord::Migration[7.0]
  def change
    add_column :auction_items, :user_id, :integer
  end
end
