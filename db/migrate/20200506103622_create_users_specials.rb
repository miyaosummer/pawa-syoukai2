class CreateUsersSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :users_specials do |t|
      t.references :special, null:false, foreign_key:true
      t.references :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end
