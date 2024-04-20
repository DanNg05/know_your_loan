class AddDetailsToBroker < ActiveRecord::Migration[7.1]
  def change
    add_column :brokers, :first_name, :string
    add_column :brokers, :last_name, :string
    add_column :brokers, :phone_number, :string
    add_column :brokers, :address, :string
  end
end
