class CreateCourseSubjectTasks < ActiveRecord::Migration
  def change
    create_table :course_subject_tasks do |t|
      t.integer :course_subject_id
      t.integer :task_id
      t.boolean :status

      t.timestamps
    end
  end
end
