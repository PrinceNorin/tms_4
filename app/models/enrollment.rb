class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :enrollment_subjects, dependent: :destroy
  has_many :subjects, through: :enrollment_subjects, source: :subject

  validates_presence_of :user_id, :course_id

  def enrolled_at
    created_at.strftime "%Y/%m/%d"
  end
end
