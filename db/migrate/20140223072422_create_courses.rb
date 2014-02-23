class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :day
      t.integer :period
      t.string :teacher
      t.string :memo

      t.timestamps
    end
  end
end
