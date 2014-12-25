class Supervisor::CourseSubjectsController < ApplicationController
  before_action :supervisor_auth

  def update
    respond_to do |format|
      format.js do
        @course_subject = CourseSubject.find params[:id]
        @course = @course_subject.course
        @course_subject.update_attributes status: !@course_subject.status
      end
    end
  end
end
