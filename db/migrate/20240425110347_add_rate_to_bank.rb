class AddRateToBank < ActiveRecord::Migration[7.1]
  def change
    add_column :banks, :one_year, :decimal
    add_column :banks, :two_years, :decimal
    add_column :banks, :three_years, :decimal
  end
end
