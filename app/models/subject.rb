class Subject < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :tasks

  validates_presence_of :name
end
