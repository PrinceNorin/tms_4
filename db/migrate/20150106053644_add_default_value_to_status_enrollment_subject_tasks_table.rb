class AddDefaultValueToStatusEnrollmentSubjectTasksTable < ActiveRecord::Migration
  def change
    change_column_default :enrollment_subject_tasks, :status, false
  end
end
