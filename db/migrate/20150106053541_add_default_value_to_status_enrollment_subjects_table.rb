class AddDefaultValueToStatusEnrollmentSubjectsTable < ActiveRecord::Migration
  def change
    change_column_default :enrollment_subjects, :status, false
  end
end
