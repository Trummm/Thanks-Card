class CardTemplate < ApplicationRecord
  has_many :thank_cards
  has_one_attached :background
end
