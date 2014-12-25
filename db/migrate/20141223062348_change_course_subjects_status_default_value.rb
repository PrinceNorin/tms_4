class ChangeCourseSubjectsStatusDefaultValue < ActiveRecord::Migration
  def change
    change_column_default :course_subjects, :status, false
    CourseSubject.where("status = ?", nil).each do |course_subject|
      course_subject.update_attribute :status, false
    end
  end
end
