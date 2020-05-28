class CreateBasics < ActiveRecord::Migration[5.2]
  def change
    create_table :basics do |t|
      t.string :name
      t.integer :number
      t.integer :user_id
      t.integer :basic_id
      t.timestamps
    end
  end
end
