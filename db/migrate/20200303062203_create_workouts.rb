class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name 
      t.integer :distance 
      t.integer :time
      t.string :time_units
      t.datetime :date 
      t.integer :reps 
      t.integer :number_reps
      t.integer :weight
      t.integer :user_id
    end
  end
end
