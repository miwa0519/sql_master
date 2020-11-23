ActiveRecord::Base.transaction do
  # Seed example
  fixtures = Rails.root.join('db', 'seeds', 'fixtures')

  # Universities
  data = JSON.parse(File.read(Rails.root.join(fixtures, 'universities.json')))
  data['universities'].each do |university|
    University.find_or_create_by!(name: university['name'])
  end

  # Teachers
  data = JSON.parse(File.read(Rails.root.join(fixtures, 'teachers.json')))
  data['teachers'].each do |teacher|
    Teacher.find_or_create_by!(
      name: teacher['name'],
      university: University.find_by(name: teacher['university'])
    )
  end

  # Student
  data = JSON.parse(File.read(Rails.root.join(fixtures, 'students.json')))
  data['students'].each do |student|
    Student.find_or_create_by!(
      name: student['name'],
      university: University.find_by(name: student['university'])
    )
  end

  # Subjects
  data = JSON.parse(File.read(Rails.root.join(fixtures, 'subjects.json')))
  data['subjects'].each do |subject|
    Subject.find_or_create_by!(
      name: subject['name'],
      credit: subject['credit'],
      required: subject['required'],
      teachers: [Teacher.find_by(name: subject['teacher'])]
    )
  end

  # Units
  data = JSON.parse(File.read(Rails.root.join(fixtures, 'units.json')))
  data['units'].each do |unit|
    subject = Subject.find_by(name: unit['subject_name'])
    Unit.find_or_create_by!(
      name: "第#{unit['name']}回",
      subject: subject,
      parent_unit: Unit.find_by(name: "第#{unit['name'].to_i - 1}回", subject: subject)
    )
  end

  #  CourseRegistration
  data = JSON.parse(File.read(Rails.root.join(fixtures, 'course_registrations.json')))
  data['course_registrations'].each do |course_registration|
    course_registration['subjects'].each do |subject_attributes|
      course_registration = CourseRegistration.find_or_create_by!(
        name: course_registration['name'],
        year: course_registration['year'],
        grade: course_registration['grade'],
        student: Student.find_by(name: course_registration['student_name']),
      )

      subject = Subject.find_by(name: subject_attributes['name'])
      subject_course_registration = SubjectCourseRegistration.find_or_create_by!(
        course_registration: course_registration,
        subject: subject
      )

      subject_attributes['subject_course_registration_units'].each do |subject_course_registration_unit|
        unit_name = subject_course_registration_unit['unit_name']
        SubjectCourseRegistrationUnit.find_or_create_by!(
          subject_course_registration: subject_course_registration,
          unit: Unit.find_by(subject: subject, name: unit_name),
          attendance: subject_course_registration_unit['attendance']
        )
      end
    end
  end
end
