class AddImageLinkFieldToAuctionItem < ActiveRecord::Migration[7.0]
  def change
    add_column :auction_items, :image_link, :string
  end
end
