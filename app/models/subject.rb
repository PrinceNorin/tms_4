class Subject < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy, inverse_of: :subject
  has_many :enrollment_subjects, dependent: :destroy

  accepts_nested_attributes_for :tasks, allow_destroy: true

  validates_presence_of :name
end
