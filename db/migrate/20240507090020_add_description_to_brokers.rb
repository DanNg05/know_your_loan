class AddDescriptionToBrokers < ActiveRecord::Migration[7.1]
  def change
    add_column :brokers, :description, :string
  end
end
