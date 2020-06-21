class University < ApplicationRecord
  has_many :university_teachers
  has_many :teachers, through: :university_teachers
  has_many :university_students
  has_many :students, through: :university_students
end
