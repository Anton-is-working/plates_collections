class AddJtiToAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :jti, :string, null: false
    add_index :admins, :jti, unique: true
  end
end
