class AddCoordinatesToBrokers < ActiveRecord::Migration[7.1]
  def change
    add_column :brokers, :latitude, :float
    add_column :brokers, :longitude, :float
  end
end
