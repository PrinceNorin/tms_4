class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  has_many :course_subject_tasks, dependent: :destroy
  accepts_nested_attributes_for :course_subject_tasks
  after_save :update_course_subject_status

  scope :unfinish_subjects,-> {
    where status: false
  }

  private
    def update_course_subject_status
      if status != true && 
        course_subject_tasks.count != 0 && 
        course_subject_tasks.unfinish_tasks.count == 0
        
       self.update status: true
      end
    end
end
