class CreateSubjectCourseRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_course_registrations do |t|
      t.references :subject
      t.references :course_registration

      t.timestamps
    end

    add_index :subject_course_registrations, %i[subject_id course_registration_id], unique: true, name: 'index_subject_course_registrations_on_uniqueness'
  end
end
