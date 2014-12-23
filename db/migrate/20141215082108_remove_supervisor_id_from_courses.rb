class RemoveSupervisorIdFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :supervisor_id
  end
end
