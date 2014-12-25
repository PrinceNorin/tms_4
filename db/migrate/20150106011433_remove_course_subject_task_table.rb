class RemoveCourseSubjectTaskTable < ActiveRecord::Migration
  def change
    drop_table :course_subject_tasks
  end
end
