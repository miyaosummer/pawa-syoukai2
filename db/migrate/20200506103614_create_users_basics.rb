class CreateUsersBasics < ActiveRecord::Migration[5.2]
  def change
    create_table :users_basics do |t|
      t.integer :user_id, foreign_key: true
      t.integer :basic_id, foreign_key: true
      t.timestamps
    end
  end
end
