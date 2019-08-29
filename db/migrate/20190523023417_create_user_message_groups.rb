class CreateUserMessageGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_message_groups do |t|
      t.references :user, foreign_key: true
      t.references :message_group, foreign_key: true

      t.timestamps
    end
  end
end
