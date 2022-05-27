class AddTotalLikesCount < ActiveRecord::Migration[6.1]
  def change
    add_column :thank_cards, :total_likes_count, :integer
  end
end
