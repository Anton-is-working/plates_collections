class CreatePlates < ActiveRecord::Migration[6.1]
  def change
    create_table :plates do |t|
      t.string :title, null: false
      t.integer :order

      t.timestamps
    end

    add_reference :plates, :collection, foreign_key: true
  end
end
