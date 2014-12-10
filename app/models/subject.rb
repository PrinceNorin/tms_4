class Subject < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :task, dependent: :destroy
end
