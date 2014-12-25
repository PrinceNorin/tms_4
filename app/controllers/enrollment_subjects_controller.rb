class EnrollmentSubjectsController < ApplicationController
   before_action :user_auth

  def show
    @course = Course.find_by id: params[:course_id]
    @enrollment_subject = EnrollmentSubject.find params[:id]
  end

  def update
    @course = Course.find_by id: params[:course_id]
    @enrollment_subject = EnrollmentSubject.find params[:id]        
    if @enrollment_subject.update_attributes course_subject_params      
      render "show"
    end    
  end

  private
    def course_subject_params
      params.require(:enrollment_subject).permit enrollment_subject_tasks_attributes:
      [:id,:task_id,:status]
    end
end
