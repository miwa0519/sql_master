class CreateSubjectTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_teachers do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end

    add_index :subject_teachers, %i[subject_id teacher_id], unique: true, name: 'index_subject_teachers_on_uniqueness'
  end
end
