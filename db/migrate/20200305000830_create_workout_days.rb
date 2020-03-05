class CreateWorkoutDays < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_days do |t|
      t.datetime :day
      t.integer :workout_id 
      t.integer :
  end
end
