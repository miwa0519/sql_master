class Student < ApplicationRecord
  has_one :university_student
  has_one :university, through: :university_student
  has_many :student_course_registration
  has_many :course_registrations, through: :student_course_registration
end
