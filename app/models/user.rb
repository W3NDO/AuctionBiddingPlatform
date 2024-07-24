class User < ApplicationRecord

    validates :email, presence: true
    validates :name, presence: true

    enum actioneer: {0: true, 1: false}
    enum bidder: {0: true, 1: false}
end
