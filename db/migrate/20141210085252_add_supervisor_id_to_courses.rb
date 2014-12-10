class AddSupervisorIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :supervisor_id, :integer
  end
end
