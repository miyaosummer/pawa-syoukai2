class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.string :name,unique: true
      t.integer :special_id
      t.integer :user_id
      t.timestamps
    end
  end
end
