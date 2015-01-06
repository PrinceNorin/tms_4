class Supervisor::CourseSubjectsController < ApplicationController
  before_action :supervisor_auth

  def show
    @course_subject = CourseSubject.find params[:id]
  end

  def update
    @course_subject = CourseSubject.find params[:id]
    @course = @course_subject.course
    @course_subject.update_attributes status: !@course_subject.status
  end
end
