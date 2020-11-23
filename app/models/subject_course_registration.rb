class SubjectCourseRegistration < ApplicationRecord
  belongs_to :subject
  belongs_to :course_registration
  has_many :subject_course_registration_units
end
