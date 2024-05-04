class AddNewColumnsToHomebuyers < ActiveRecord::Migration[7.1]
  def change
    add_column :homebuyers, :principal_payments, :decimal, array: true
    add_column :homebuyers, :interest_payments, :decimal, array: true
  end
end
