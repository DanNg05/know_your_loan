class AddNewColumnsToMortgage < ActiveRecord::Migration[7.1]
  def change
    add_column :mortgages, :loan_amount, :decimal
    add_column :mortgages, :monthly_repayment, :decimal
    add_column :mortgages, :monthly_cashflow, :decimal
  end
end
