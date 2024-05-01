class AddUsertypeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_homebuyer, :boolean, default: false, null: false
  end
end
