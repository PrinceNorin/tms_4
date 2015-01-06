class CreateEnrollmentSubjectTasks < ActiveRecord::Migration
  def change
    create_table :enrollment_subject_tasks do |t|
      t.integer :enrollment_subject_id
      t.integer :task_id
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
    add_index :enrollment_subject_tasks, :user_id
  end
end
