class AddDetailsToThankCards < ActiveRecord::Migration[6.1]
  def change
    add_reference :thank_cards, :user_take_thank_card, null: false, foreign_key: true, if_not_exists: true
  end
end
