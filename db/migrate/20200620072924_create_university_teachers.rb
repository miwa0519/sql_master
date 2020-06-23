class CreateUniversityTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :university_teachers do |t|
      t.references :university, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
