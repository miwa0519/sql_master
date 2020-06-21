class CreateStudentCourseRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :student_course_registrations do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course_registration, null: false, foreign_key: true

      t.timestamps
    end
  end

  add_index :student_course_registrations, %i[student_id course_registration_id], unique: true, name: 'index_student_course_registrations_on_uniqueness'
end
