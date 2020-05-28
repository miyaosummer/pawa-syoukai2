class CreateUsersSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :users_specials do |t|
      t.integer :user_id, foreign_key: true
      t.integer :special_id, foreign_key: true
      t.timestamps
    end
  end
end
