FactoryBot.define do
  factory :bid do
    bidder_id { 1 }
    auction_item_id { 1 }
    amount { "9.99" }
    bid_time { "2024-07-24 19:51:41" }
  end
end
