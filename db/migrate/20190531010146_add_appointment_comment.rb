class AddAppointmentComment < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :appointment_description, :text
  end
end
