class Comment < ApplicationRecord
  belongs_to       :thank_card
  belongs_to       :user
  has_one_attached :image

  validates_presence_of :thank_card_id
  validates_presence_of :user_id
end
