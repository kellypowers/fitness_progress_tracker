class CreateWorkoutGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_goals do |t|
      t.datetime :day
      t.integer :workout_id 
      t.integer :goal_id
    end
  end
end
