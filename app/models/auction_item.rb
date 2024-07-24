class AuctionItem < ApplicationRecord

  validates :name, presence: true
  validates :image_link, presence: true # TODO use regex for validation as well.
  validates :starting_price, numericality: { greater_than_or_equal_to: 0 }

  # Enum definition
  enum status: { active: 0, sold: 1, cancelled: 2 }
end
