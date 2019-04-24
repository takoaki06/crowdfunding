class AddThumbnailToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :thumbnail, :string
  end
end
