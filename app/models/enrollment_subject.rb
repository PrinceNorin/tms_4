class EnrollmentSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :subject
  belongs_to :enrollment
  has_many :enrollment_subject_tasks, dependent: :destroy
  accepts_nested_attributes_for :enrollment_subject_tasks
  after_save :update_enrollment_subject_status

  scope :unfinish_subjects,-> {
    where status: false
  }
  
  def started_at
    created_at.strftime "%Y/%m/%d"
  end

  def ended_at
    updated_at.strftime "%Y/%m/%d"
  end
  private
    def update_enrollment_subject_status
      if status != true && 
        enrollment_subject_tasks.count != 0 && 
        enrollment_subject_tasks.unfinish_tasks.count == 0
        self.update status: true
      end
    end
end
