class RemoveColumnFromHomebuyers < ActiveRecord::Migration[7.1]
  def change
    remove_column :homebuyers, :principal_payments, :decimal
    remove_column :homebuyers, :interest_payments, :decimal
  end
end
