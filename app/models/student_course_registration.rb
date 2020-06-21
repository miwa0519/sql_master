class StudentCourseRegistration < ApplicationRecord
  belongs_to :student
  belongs_to :course_registration
end
