class CreateEnrollmentSubjects < ActiveRecord::Migration
  def change
    create_table :enrollment_subjects do |t|
      t.integer :enrollment_id
      t.integer :course_id
      t.integer :subject_id
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
      add_index :enrollment_subjects, :enrollment_id
      add_index :enrollment_subjects, :user_id
      add_index :enrollment_subjects, :course_id
      add_index :enrollment_subjects, :subject_id
      add_index :enrollment_subjects, [:course_id, :subject_id], unique: true   
  end 
end
