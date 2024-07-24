class AuctionItem < ApplicationRecord
  has_many :bids, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :image_link, presence: true 
  validates :end_date, presence: true # validate the date to also be in the future
  validates :starting_price, presence: true 
  validates :image_link, :format => {
    :with => /\A((http|https):\/\/)?[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)+([\/a-zA-Z0-9\-\._~:?#\[\]@!$&'()*+,;=]*)?\z/,
    :message => 'Invalid link format'
  }
  validates :starting_price, numericality: true
  validates :starting_price, numericality: { greater_than_or_equal_to: 0 }

  # Enum definition
  enum status: { active: 0, sold: 1, cancelled: 2 }
end
