require 'rails_helper'

RSpec.describe AuctionItemChannel, type: :channel do
  context "Channel subscription" do
    it "successfully subscribes and auction to the channel" do
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      correct_item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com", user_id: user.id )

      subscribe id: correct_item.id
      expect(subscription).to be_confirmed
    end
  end
end
