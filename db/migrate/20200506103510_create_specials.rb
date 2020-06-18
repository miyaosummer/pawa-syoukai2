class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.string :name,unique: true
      t.references :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end
