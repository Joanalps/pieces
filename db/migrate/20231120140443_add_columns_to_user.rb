class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :top_size, :integer
    add_column :users, :bottom_size, :integer
    add_column :users, :shoe_size, :integer
    add_column :users, :address, :string
  end
end
