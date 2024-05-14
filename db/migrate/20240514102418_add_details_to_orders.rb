class AddDetailsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :email, :string
    add_column :orders, :description, :string
    add_column :orders, :about, :text
    add_column :orders, :address, :string
    add_column :orders, :phone_number, :string
  end
end
