class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name 
      #t.datetime :date #day of week/ number of days ? 
      #t.integer :frequency
      t.integer :user_id
    end
  end
end
