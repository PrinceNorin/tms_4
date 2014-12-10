class Course < ActiveRecord::Base
  belongs_to :supervisor
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  has_many :activities, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
end
