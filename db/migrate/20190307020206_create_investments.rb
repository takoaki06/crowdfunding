class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.integer :price
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
