class AddEmailAndAboutToBroker < ActiveRecord::Migration[7.1]
  def change
    add_column :brokers, :email, :string
    add_column :brokers, :about, :text
  end
end
