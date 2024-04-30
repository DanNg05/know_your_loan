class AddColumnToHomebuyers < ActiveRecord::Migration[7.1]
  def change
    add_column :homebuyers, :principal_payments_first_year, :decimal
    add_column :homebuyers, :interest_payments_first_year, :decimal
    add_column :homebuyers, :total_interest_paid, :decimal
    add_column :homebuyers, :total_mortgage_repayment, :decimal
    add_column :homebuyers, :interest_rate_safery, :decimal
  end
end
