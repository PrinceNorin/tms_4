class RemoveIndexEnrollmentSubjectsOnCourseIdAndSubjectId < ActiveRecord::Migration
  def change
    remove_index :enrollment_subjects, name: :index_enrollment_subjects_on_course_id_and_subject_id
  end
end
