class Bid < ApplicationRecord
    belongs_to :user
    belongs_to :auction_item

    monetize :amount_cents, with_model_currency: :currency

    validates :amount_cents, presence: true
    validates :bid_time, presence: true
end
