class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :name, null: false
      t.text :surname, null: false
      t.boolean :email, null: false
      t.integer :from

      t.timestamps
    end
  end
end
