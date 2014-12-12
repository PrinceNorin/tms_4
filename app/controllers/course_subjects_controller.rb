class CourseSubjectsController < ApplicationController
  before_action :user_auth

  def show
    @course = Course.find_by id: params[:course_id]
    @course_subject = CourseSubject.find params[:id]
  end

  def update
    @course = Course.find_by id: params[:course_id]
    @course_subject = CourseSubject.find params[:id]        
    if @course_subject.update_attributes course_subject_params      
      render "show"
    end    
  end

  private
    def course_subject_params
      params.require(:course_subject).permit course_subject_tasks_attributes:
      [:id,:task_id,:status]
  end
end
