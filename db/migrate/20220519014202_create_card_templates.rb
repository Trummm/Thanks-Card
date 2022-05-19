class CreateCardTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :card_templates do |t|
      t.string :name
      t.string :image_url
      t.json :top
      t.json :right
      t.json :bottom
      t.json :left

      t.timestamps
    end
  end
end
