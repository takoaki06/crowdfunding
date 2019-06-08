class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :comment
      t.references :message_group, foreign_key: true, null: false
      t.references :sender, foreign_key: { to_table: :users }, null: false


      t.timestamps
    end
  end
end
