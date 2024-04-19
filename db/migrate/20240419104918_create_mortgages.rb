class CreateMortgages < ActiveRecord::Migration[7.1]
  def change
    create_table :mortgages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
