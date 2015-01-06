class Course < ActiveRecord::Base
  belongs_to :supervisor
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  has_many :activities, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :enrollment_subjects, dependent: :destroy
  
  after_save :create_course_subject_tasks

  validates_presence_of :name, :description, :user_id
  validates_numericality_of :duration
  
  private
  
    def create_course_subject_tasks
      course_subjects.each do |course_subject|
        course_subject.subject.tasks.each do |task|
          if course_subject.course_subject_tasks.find_by_task_id(task.id).nil?
            course_subject.course_subject_tasks.create task_id: task.id
          end
        end
      end
    end
end
