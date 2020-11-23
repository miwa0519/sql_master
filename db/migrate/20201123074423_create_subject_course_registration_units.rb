class CreateSubjectCourseRegistrationUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_course_registration_units do |t|
      t.references :subject_course_registration,
                   null: false,
                   foreign_key: true,
                   index: { name: 'index_for_subject_course_registration' }
      t.references :unit, null: false, foreign_key: true
      t.boolean :attendance

      t.timestamps
    end
  end
end
