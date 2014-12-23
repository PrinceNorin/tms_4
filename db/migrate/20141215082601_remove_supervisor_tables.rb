class RemoveSupervisorTables < ActiveRecord::Migration
  def change
    drop_table :supervisors
  end
end
