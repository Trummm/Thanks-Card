class CreateThankCards < ActiveRecord::Migration[6.1]
  def change
    create_table :thank_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :card_template, null: false, foreign_key: true
      t.string :message
      
      t.timestamps
    end
  end
end