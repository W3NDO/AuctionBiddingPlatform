require 'faker'

# Auction Item seed. 
# descriptions were generated with chat GPT using the following prompt 'Write a 50 word description for ITEM_NAME to be sold at an auction.'

auction_items = [
    {
      "name": "Antique Vase",
      "description": "A rare porcelain vase from the Ming Dynasty, beautifully crafted with intricate designs.",
      "starting_price_cents": 200.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/1/400/200"
    },
    {
      "name": "Vintage Pocket Watch",
      "description": "An elegant gold pocket watch from the early 1900s, in perfect working condition.",
      "starting_price_cents": 700.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/2/400/200"
    },
    {
      "name": "Original Picasso Painting",
      "description": "An original oil painting by Pablo Picasso, featuring his unique cubist style.",
      "starting_price_cents": 500.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/3/400/200"
    },
    {
      "name": "Classic Car",
      "description": "A fully restored 1965 Ford Mustang, a timeless classic in mint condition.",
      "starting_price_cents": 24000.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/4/400/200"
    },
    {
      "name": "Diamond Necklace",
      "description": "A stunning diamond necklace with a total of 5 carats of flawless diamonds.",
      "starting_price_cents": 50000.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/5/400/200"
    },
    {
      "name": "Signed First Edition Book",
      "description": "A first edition of 'To Kill a Mockingbird' signed by Harper Lee, in excellent condition.",
      "starting_price_cents": 1200.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/6/400/200"
    },
    {
      "name": "Handcrafted Wooden Furniture Set",
      "description": "A unique set of handcrafted wooden furniture, including a dining table and chairs, made from reclaimed oak.",
      "starting_price_cents": 2000.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/7/400/200"
    },
    {
      "name": "Luxury Watch",
      "description": "A Rolex Submariner watch, featuring a stainless steel case and a black dial.",
      "starting_price_cents": 2200.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/8/400/200"
    },
    {
      "name": "Vintage Guitar",
      "description": "A 1959 Gibson Les Paul Standard guitar, a prized possession for any collector or musician.",
      "starting_price_cents": 1200.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/9/400/200"
    },
    {
      "name": "Rare Coin Collection",
      "description": "A collection of rare and valuable coins from various historical periods and regions.",
      "starting_price_cents": 900.00,
      "end_date": "29-10-2024",
      "image_link": "https://picsum.photos/id/10/400/200"
    }
  ]
  


def create_user
    User.create!(
        name:  Faker::Internet.username(specifier: 5..8),
        email:  Faker::Internet.email,
        password:  "foobar123",
        password_confirmation:  "foobar123",
    )
end

def create_bid(items, users)
    item = items.sample
    user = users.sample
    bid = Bid.create(
        user_id: user.id, 
        auction_item_id: item.id, 
        amount_cents: rand(item.starting_price_cents..(item.starting_price_cents*2)),
        bid_time: Time.now
    )
end

# create the auction items

5.times { create_user }
auction_items.each do |item|
    AuctionItem.create!(**item, user_id: User.ids&.sample)
end

users = []
# create 5 users

# create 5 bids
5.times { create_bid(AuctionItem.all, User.all) }



