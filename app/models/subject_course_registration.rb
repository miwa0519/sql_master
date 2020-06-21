class SubjectCourseRegistration < ApplicationRecord
  belongs_to :subject
  belongs_to :course_registration
end
