module ThankCardsHelper
  def thank_card_like_by_user? thank_card_id
    Like.where(thank_card_id: thank_card_id, user_id: current_user.id).any?
  end
end
