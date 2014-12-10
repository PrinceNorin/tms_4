class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :subject_id
      t.integer :task_id
      t.string :temp_type

      t.timestamps
    end
  end
end
