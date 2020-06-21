class Subject < ApplicationRecord
  has_many :subject_teachers
  has_many :teachers, through: :subject_teachers
  has_many :subject_course_registrations
  has_many :course_registration, through: :subject_course_registrations
end
