# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create user sample data
user = User.create name: "norin", email: "norin@example.com",
                   password: "secret", password_confirmation: "secret"

# create supervisor sample data
supervisor = User.create name: "PrinceNorin", email: "prince@example.com",
          password: "secret", password_confirmation: "secret", supervisor: true

# create courses sample data
30.times do
  supervisor.courses.create name: Faker::Lorem.sentence,
                  description: Faker::Lorem.paragraph(8),
                  duration: 30
end

# create subjects sample data
subjects = []
4.times do
  subject = Subject.create  name: Faker::Lorem.sentence,
                            instruction:Faker::Lorem.paragraph(7)
  5.times { subject.tasks.create name: Faker::Lorem.sentence }
  subjects << subject
end

# create course_subjects sample data
Course.all.each do |course|
  subjects.each do |subject|
    course.course_subjects.create subject_id: subject.id
  end
end

# create course_subject_tasks sample data
CourseSubject.all.each do |course_subject|
  course_subject.subject.tasks.each do |task|
    course_subject.course_subject_tasks.create task_id: task.id, status: false
  end
end

user.enrollments.create course_id: Course.first.id,status: false
