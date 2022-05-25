class Like < ApplicationRecord
  belongs_to :user
  belongs_to :thank_card
  validates :user_id, uniqueness: { scope: :thank_card_id }
end
