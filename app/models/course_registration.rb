class CourseRegistration < ApplicationRecord
  has_one :student_course_registration
  has_one :student, through: :student_course_registration
  has_many :subject_course_registrations
  has_many :subjects, through: :subject_course_registrations
end
