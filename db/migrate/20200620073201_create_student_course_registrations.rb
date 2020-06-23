class CreateStudentCourseRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :student_course_registrations do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course_registration, null: false, foreign_key: true

      t.timestamps
    end
  end
end
