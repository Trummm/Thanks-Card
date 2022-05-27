class Like < ApplicationRecord
  belongs_to :user
  belongs_to :thank_card
  validates :user_id, uniqueness: { scope: :thank_card_id }

  after_create :increase_thank_card_like_counter
  after_destroy :decrease_thank_card_like_counter

  private
  def increase_thank_card_like_counter
    ThankCard.find(self.thank_card_id).increment(:total_likes_count).save
  end

  def decrease_thank_card_like_counter
    ThankCard.find(self.thank_card_id).decrement(:total_likes_count).save
  end
end
