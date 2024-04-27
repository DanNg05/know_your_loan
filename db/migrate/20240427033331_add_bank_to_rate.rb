class AddBankToRate < ActiveRecord::Migration[7.1]
  def change
    add_reference :rates, :bank, null: false, foreign_key: true
  end
end
