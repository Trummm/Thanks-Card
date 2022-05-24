class CardTemplate < ApplicationRecord
  has_many :thank_cards
  has_one_attached :background

  validates :name, :top, :right, :bottom, :left, presence: true
end
