class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.string :name 
      t.integer :distance 
      t.integer :time
      t.string :time_units
      t.integer :number  #number and reps or sets  same?
      t.integer :reps 
      t.integer :sets
      t.integer :weight
      t.integer :workout_id
    end
  end
end
