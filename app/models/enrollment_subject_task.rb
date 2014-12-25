class EnrollmentSubjectTask < ActiveRecord::Base
  belongs_to :enrollment_subject
  belongs_to :task
  belongs_to :user
  after_save :update_enrollment_subject_task_activity
  
  scope :unfinish_tasks,-> {
    where status: false
  }

  private
    def update_enrollment_subject_task_activity
      if self.status == true
        activity = Activity.where(user_id:user.id,task_id:task.id,
          course_id:enrollment_subject.course_id,
          subject_id:enrollment_subject.subject_id).first
        if !activity.nil?
          temp_type = "refinish"
        else
            temp_type = "finish"
        end
        Activity.create user_id:user.id,task_id:task.id,
                        course_id:enrollment_subject.course_id,
                        subject_id:enrollment_subject.subject_id,
                        temp_type: temp_type
      end
    end
end
