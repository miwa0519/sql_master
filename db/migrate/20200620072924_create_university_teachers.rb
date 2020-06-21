class CreateUniversityTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :university_teachers do |t|
      t.references :university, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end

  add_index :university_teachers, %i[university_id teacher_id], unique: true, name: 'index_university_teachers_on_uniqueness'
end
