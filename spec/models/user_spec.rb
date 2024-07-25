require 'rails_helper'

RSpec.describe User, type: :model do
  context "Creating a new user" do 
    it "ensures email available" do
      user = User.create(name: "John Doe")

      expect(user.valid?).to be false
      expect(user.errors.messages[:email]).to eq(["can't be blank"])
    end

    it "ensures password available" do
      user = User.create(name: "John Doe", email: "email@example.com")

      expect(user.valid?).to be false
      expect(user.errors.messages[:password]).to eq(["can't be blank"])
    end
    
    it "ensures name is present" do
      user = User.create(email: "test@example.com", password: "foobar123", password_confirmation: "foobar123")

      expect(user.valid?).to be false
      expect(user.errors.messages[:name]).to eq(["can't be blank"])
    end
    
  end
end
