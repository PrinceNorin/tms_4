class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject    

  scope :unfinish_subjects,-> {
    where status: false
  }
end
