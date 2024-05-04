class ChangeColumnNameToHomebuyers < ActiveRecord::Migration[7.1]
  def change
    rename_column :homebuyers, :principal_payments_first_year, :principal_payments
    rename_column :homebuyers, :interest_payments_first_year, :interest_payments
    rename_column :homebuyers, :interest_rate_safery, :interest_rate_safety
  end
end
