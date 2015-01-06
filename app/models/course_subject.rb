class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  after_create :create_enrollment_subjects
  after_save :update_enrollment_subjects_status

  scope :unfinish_subjects,-> {
    where status: false
  }

  private

    def create_enrollment_subjects
      course.enrollments.each do |enrollment|
        enrollment.enrollment_subjects.create course_id: course_id,
                                              subject_id: subject_id,
                                              user_id: enrollment.user_id
      end
    end

    def update_enrollment_subjects_status
      sql = "course_id = ? AND subject_id = ?"
      enrollment_subjects = EnrollmentSubject.where(sql, course_id, subject_id)
      if enrollment_subjects.any?
        enrollment_subjects.each do |enrollment_subject|
          enrollment_subject.update_attributes status: !status
        end
      end
    end
end
