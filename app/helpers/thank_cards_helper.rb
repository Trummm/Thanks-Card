module ThankCardsHelper
  def thank_card_like_by_user? thank_card_id
    current_user.likes.find_by(thank_card_id: thank_card_id).present?
  end
end
