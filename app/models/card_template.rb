class CardTemplate < ApplicationRecord
  has_many :thank_cards
  has_one_attached :background

  validates :name, presence: true, length: { maximum: 50 }
  validates :top, presence: true
  validates :right, presence: true
  validates :bottom, presence: true
  validates :left, presence: true
end
