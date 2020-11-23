## ERD

- University: 大学
- UniversityTeacher 大学の教員
- Teacher 教員
- University Student: 大学の生徒
- Student: 生徒
- Student CourseRegistration 生徒の履修登録
- CourseRegistration 履修登録
- SubjectCourseRegistration 履修登録の科目
- SubjectCourceRegistrationUnit 履修登録科目の単元
- Subject 科目
- Unit 単元
- Subject Teacher 科目の教員

```plantuml
left to right direction

entity "universities" {
  + id [PK]
  --
  name
}

entity "teachers" {
  + id [PK]
  --
  name
}

entity "students" {
  + id [PK]
  --
  name
}

entity "university_teachers" {
  + id [PK]
  --
  * university_id <<FK>>
  * students_id <<FK>>
}

entity "university_students" {
  + id [PK]
  --
  * university_id <<FK>>
  * students_id <<FK>>
}

entity "course_registrations" {
  + id [PK]
  --
  name
  year
  grade
}

entity "student_course_registrations" {
  + id [PK]
  --
  * students_id <<FK>>
  * course_registration_id <<FK>>
}

entity "subject_course_registrations" {
  + id [PK]
  --
  * subject_id <<FK>>
  * course_registration_id <<FK>>
}

entity "subject_course_registration_units" {
  + id [PK]
  --
  * subject_course_registration_id <<FK>>
  * unit_id <<FK>>
  attendance
}

entity "subject_teachers" {
  + id [PK]
  --
  * subject_id <<FK>>
  * teacher_id <<FK>>
}

entity "subjects" {
  + id [PK]
  --
  name
  credit
  required
}

entity "units" {
  + id [PK]
  --
  * subject_id <<FK>>
  name
  * parent_unit_id <<FK>>
}

students ||--o{ university_students
university_students }o--|| universities
universities ||--o{ university_teachers
university_teachers }o-|| teachers
students ||-o{ student_course_registrations
student_course_registrations }o-|| course_registrations
course_registrations ||--o{ subject_course_registrations
subject_course_registrations }o--|| subjects
subject_course_registrations ||-o{ subject_course_registration_units
subject_course_registration_units }o--|| units
subjects ||--o{ subject_teachers
subjects ||-o{ units
units }o--o{ units
subject_teachers }o--|| teachers
```
