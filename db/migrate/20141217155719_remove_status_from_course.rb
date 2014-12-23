class RemoveStatusFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :status
  end
end
