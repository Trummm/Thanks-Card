class CreateCardTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :card_templates do |t|
      t.string :name
      t.string :image_url
      t.string :top
      t.string :right
      t.string :bottom
      t.string :left

      t.timestamps
    end
  end
end
