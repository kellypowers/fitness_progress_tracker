class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    # do i want to relate to workouts? make a true/false if reached or not? make a "couch to 5k" template?
    create_table :goals do |t|
      t.string :name
      t.string :description
      #t.string :progress # do i need this? also, 
      t.integer :user_id
    end
  end
end
