class AddMoreColumnsToMortgage < ActiveRecord::Migration[7.1]
  def change
    add_column :mortgages, :rental_income, :decimal
    add_column :mortgages, :maintainence_fund, :decimal
    add_column :mortgages, :other_expenses, :decimal
  end
end
