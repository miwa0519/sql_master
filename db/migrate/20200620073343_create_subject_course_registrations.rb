class CreateSubjectCourseRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_course_registrations do |t|
      t.references :subject
      t.references :course_registration

      t.timestamps
    end
  end
end
