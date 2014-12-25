class Task < ActiveRecord::Base
  belongs_to :subject, inverse_of: :tasks
  has_many :activities, dependent: :destroy
  has_many :course_subject_tasks, dependent: :destroy

  validates_presence_of :subject, :name
end
