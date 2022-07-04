class RemoveImageFromCardTemplate < ActiveRecord::Migration[6.1]
  def change
    remove_column :card_templates, :image_url, :string, if_exists: true
  end
end
