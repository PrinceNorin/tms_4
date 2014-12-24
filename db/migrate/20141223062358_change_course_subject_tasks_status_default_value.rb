class ChangeCourseSubjectTasksStatusDefaultValue < ActiveRecord::Migration
  def change
    change_column_default :course_subject_tasks, :status, false
    CourseSubjectTask.where("status = ?", nil).each do |course_subject_task|
      course_subject_task.update_attribute :status, false
    end
  end
end
