class AutoPostJob < ApplicationJob
  queue_as :auto_posts

  def perform thank_cards
    thank_card = ThankCard.create user_id: 1, user_take_thank_card_id: 3, card_template_id: 2, message: 'congratulations', approved: true
  end
end
