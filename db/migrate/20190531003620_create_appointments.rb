class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.belongs_to :user, foreign_key: true
      t.string :doctor_belongs_to

      t.timestamps
    end
  end
end
