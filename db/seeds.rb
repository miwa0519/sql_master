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

  #  CourseRegistration
  data = JSON.parse(File.read(Rails.root.join(fixtures, 'course_registrations.json')))
  data['course_registrations'].each do |course_registration|
    subjects = course_registration['subjects'].map do |subject|
      Subject.find_by(name: subject['name'])
    end

    CourseRegistration.find_or_create_by!(
      name: course_registration['name'],
      year: course_registration['year'],
      grade: course_registration['grade'],
      student: Student.find_by(name: course_registration['student_name']),
      subjects: subjects
    )
  end
end
