class Bid < ApplicationRecord
    belongs_to :user
    belongs_to :auction_item

    validates :amount, presence: true
    validates :amount, numericality: { greater_than_or_equal_to: 0 }
    validates :bid_time, presence: true
end
