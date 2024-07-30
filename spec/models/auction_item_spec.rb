require 'rails_helper'

RSpec.describe AuctionItem, type: :model do
  context "Creating a new auction item" do
    it "ensures an auction item belongs to a user" do
      item = AuctionItem.create(name: "XBOX original", description: "not a description", starting_price: 500.00, end_date: "25-07-2024")

      expect(item.valid?).to be false
      expect(item.errors.messages[:user]).to eq(["must exist"])
    end

    it "ensures name is present" do
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      item = AuctionItem.create(description: "not a description", starting_price: 500.00, end_date: "25-07-2024", user_id: user.id )

      expect(item.valid?).to be false
      expect(item.errors.messages[:name]).to eq(["can't be blank"])

    end

    it "ensures item description is present" do
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      item = AuctionItem.create(name:"XBOX original console", starting_price: 500.00, end_date: "25-07-2024", user_id: user.id )

      expect(item.valid?).to be false
      expect(item.errors.messages[:description]).to eq(["can't be blank"])
    end

    it "ensures image link is present" do
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", user_id: user )

      expect(item.valid?).to be false
      expect(item.errors.messages[:image_link].include?("can't be blank")).to be true

    end

    it "ensures image link matches the web link regex" do
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "link", user_id: user.id )
      correct_item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com", user_id: user.id )

      expect(item.valid?).to be false
      expect(item.errors.messages[:image_link].include?("Invalid link format")).to be true
      expect(correct_item.valid?).to be true
      expect(correct_item.errors.messages[:image_link].include?("Invalid link format")).to be false
    end

    it "ensures starting price is a number greater than zero" do
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      correct_item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com", user_id: user.id )
      wrong_item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: "", end_date: "25-07-2024", image_link: "https://link.com", user_id: user.id )

      expect(correct_item.valid?).to be true
      expect(wrong_item.valid?).to be false
      expect(wrong_item.errors.messages[:starting_price].include?("is not a number")).to be true
    end

    it "ensures status is active by default" do 
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      correct_item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", starting_price: 500.00, end_date: "25-07-2024", image_link: "https://link.com", user_id: user.id )

      expect(correct_item.active?).to be true
    end

    it "ensures starting bid is present" do 
      user = User.create(name: "Jane Doe", email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      item = AuctionItem.create(name:"XBOX original console", description: "mint condition console", end_date: "25-07-2024", image_link: "link", user_id: user.id )

      expect(item.valid?).to be false
      expect(item.errors.messages[:starting_price].include?("must be greater than or equal to 1")).to be true
    end
  end
end
