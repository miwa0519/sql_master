class CreateCourseRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :course_registrations do |t|
      t.string :name
      t.string :year
      t.integer :grade

      t.timestamps
    end
  end
end
