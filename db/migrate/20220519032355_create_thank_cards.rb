class CreateThankCards < ActiveRecord::Migration[6.1]
  def change
    create_table :thank_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :card_template, null: false, foreign_key: true
      t.references :user_take_thank_card, index: true
      t.string :message
      t.boolean :approved, default: false
      
      t.timestamps
    end
    add_foreign_key :thank_cards, :users, column: :user_take_thank_card_id
  end
end
