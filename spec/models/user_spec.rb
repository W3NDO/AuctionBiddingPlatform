require 'rails_helper'

RSpec.describe User, type: :model do

  context "Creating a new user" do 
    it "ensures email available" do
      user = User.create(name: "John Doe")

      expect(user.valid?).to be false
    end

    it "ensures email is valid as per regex" do 
      user = User.create(name: "John Doe", email: "test@email")

      expect(user.valid?).to be false
      expect(user.errors.messages[:email]).to eq(["Invalid email address"])
    end
    
    it "ensures name is present" do
      user = User.create(email: "test@example.com")

      expect(user.valid?).to be false
      expect(user.errors.messages[:name]).to eq(["can't be blank"])
    end
    
    it "ensures bidder is true as default" do
      user = User.create(name: "Jane Doe", email: "email@example.com")

      expect(user.bidder).to be true 

    end

    it "ensures auctioneer is false as default" do
      user = User.create(name: "Jane Doe", email: "email@example.com")

      expect(user.auctioneer).to be false 
    end
  end
end
