class ChangeEnrollmentsStatusDefaultValue < ActiveRecord::Migration
  def change
    change_column_default :enrollments, :status, false
    Enrollment.where("status = ?", nil).each do |enrollment|
      enrollment.update_attribute :status, false
    end
  end
end
