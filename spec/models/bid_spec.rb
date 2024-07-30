require 'rails_helper'

RSpec.describe Bid, type: :model do
  context "creating a new bid" do
    it "ensures bids are associated with a user" do
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com", user_id: user.id )
      bid = Bid.create(user_id: user.id, auction_item_id: item.id, amount: 700.00, bid_time: "29-07-2024")
      bad_bid = Bid.create(auction_item_id: item.id, amount: 700.00, bid_time: "29-07-2024" )

      expect(bad_bid.valid?).to be false
      expect(bad_bid.errors.messages[:user]).to eq(['must exist'])

      expect(bid.user.name).to eq("Jane Doe")
    end

    it "ensures bids are associated with an auction item" do
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com", user_id: user.id )
      bid = Bid.create(user_id: user.id, auction_item_id: item.id, amount: 700.00, bid_time: "29-07-2024")
      bad_bid = Bid.create(user_id: user.id, amount: 700.00, bid_time: "29-07-2024" )

      expect(bad_bid.valid?).to be false
      expect(bad_bid.errors.messages[:auction_item]).to eq(['must exist'])
      expect(bid.auction_item.name).to eq("XBOX original console")
    end

  
    it "ensures bid time is present" do
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com", user_id: user.id )
      bad_bid = Bid.create(user_id: user.id, auction_item_id: item.id, amount: 700.00 )

      expect(bad_bid.valid?).to be false
      expect(bad_bid.errors.messages[:bid_time].include?("can't be blank")).to be true
    end
  end
end
