class CreateUniversityStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :university_students do |t|
      t.references :university, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end

    add_index :university_students, %i[university_id student_id], unique: true, name: 'index_university_students_on_uniqueness'
  end
end
