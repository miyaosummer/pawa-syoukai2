class CreateBasics < ActiveRecord::Migration[5.2]
  def change
    create_table :basics do |t|
      t.string :name
      t.integer :number
      t.references :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end
