class AddBackgroundToCardTemplate < ActiveRecord::Migration[6.1]
  def change
    add_column :card_templates, :background, :string
  end
end
