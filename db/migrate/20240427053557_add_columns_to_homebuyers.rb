class AddColumnsToHomebuyers < ActiveRecord::Migration[7.1]
  def change
    add_column :homebuyers, :property_value, :decimal
    add_column :homebuyers, :total_deposit, :decimal
    add_column :homebuyers, :interest_rate, :float
    add_column :homebuyers, :salary, :decimal
    add_column :homebuyers, :other_income, :decimal
    add_column :homebuyers, :loan_amount, :decimal
    add_column :homebuyers, :monthly_repayment, :decimal
    add_column :homebuyers, :loan_term, :integer
    add_column :homebuyers, :living_expenses, :decimal
    add_column :homebuyers, :car_loan_payment, :decimal
    add_column :homebuyers, :other_debts, :decimal
    add_column :homebuyers, :net_disposable_income, :decimal
  end
end
