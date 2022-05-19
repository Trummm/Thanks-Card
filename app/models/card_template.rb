class CardTemplate < ApplicationRecord
  has_one_attached :image
  has_many :thank_cards
end
