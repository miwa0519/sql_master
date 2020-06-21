class Teacher < ApplicationRecord
  has_one :university_teacher
  has_one :university, through: :university_teacher
  has_many :subject_teachers
  has_many :subjects, through: :subject_teachers
end
