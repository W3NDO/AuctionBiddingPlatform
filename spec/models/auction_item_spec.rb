require 'rails_helper'

RSpec.describe AuctionItem, type: :model do
  context "Creating a new auction item" do
    it "ensures name is present" do
      item = AuctionItem.create(description: "not a description", starting_price: 500.00, end_date: "25-07-2024" )

      expect(item.valid?).to be false
      expect(item.errors.messages[:name]).to eq(["can't be blank"])

    end

    it "ensures item description is present" do
      item = AuctionItem.create(name:"XBOX original console", starting_price: 500.00, end_date: "25-07-2024" )

      expect(item.valid?).to be false
      expect(item.errors.messages[:description]).to eq(["can't be blank"])
    end

    it "ensures image link is present" do
      item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024" )

      expect(item.valid?).to be false
      expect(item.errors.messages[:image_link].include?("can't be blank")).to be true

    end

    it "ensures image link matches the web link regex" do
      item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "link" )
      correct_item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com" )

      expect(item.valid?).to be false
      expect(item.errors.messages[:image_link].include?("Invalid link format")).to be true
      expect(correct_item.valid?).to be true
      expect(correct_item.errors.messages[:image_link].include?("Invalid link format")).to be false
    end

    it "ensures starting price is a number greater than zero" do
      correct_item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com" )
      wrong_item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: "", end_date: "25-07-2024", image_link: "https://link.com" )

      expect(correct_item.valid?).to be true
      expect(wrong_item.valid?).to be false
      expect(wrong_item.errors.messages[:starting_price].include?("is not a number")).to be true
    end

    it "ensures status is active by default" do 
      correct_item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com" )

      expect(correct_item.active?).to be true
    end

    it "ensures starting bid is present" do 
      item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", end_date: "25-07-2024", image_link: "link" )

      expect(item.valid?).to be false
      expect(item.errors.messages[:starting_price].include?("can't be blank")).to be true
    end
  end
end
