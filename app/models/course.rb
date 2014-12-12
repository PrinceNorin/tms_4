class Course < ActiveRecord::Base
  belongs_to :supervisor
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  has_many :activities, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects

  scope :enrolled_by, ->(user) do
    enrolled_course_ids = "SELECT course_id FROM enrollments WHERE user_id = ?"
    where "id IN (#{enrolled_course_ids})", user.id
  end
end
