class ChangeCourseSubjectTasksStatusDefaultValue < ActiveRecord::Migration
  def change
    change_column_default :course_subject_tasks, :status, false
  end
end
