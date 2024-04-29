class RemoveBankFromMortgages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :mortgages, :bank
  end
end
