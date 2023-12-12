class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :origin
      t.string :destination
      t.time :schetime

      t.timestamps
    end
  end
end
