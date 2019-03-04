class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :desc
      t.integer :user_id

      t.timestamps
    end
  end
end
