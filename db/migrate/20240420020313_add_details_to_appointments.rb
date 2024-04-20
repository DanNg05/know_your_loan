class AddDetailsToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :date, :date
    add_column :appointments, :message, :text
    add_column :appointments, :status, :boolean
  end
end
