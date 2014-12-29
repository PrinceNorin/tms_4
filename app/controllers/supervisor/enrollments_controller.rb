class Supervisor::EnrollmentsController < ApplicationController
  before_action :supervisor_auth

  def index
    @enrollments = Enrollment.all.paginate page: params[:page], per_page: 15
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @course = Course.find_by_id params[:enrollment][:course_id]
    @enrollment = Enrollment.new
    user_ids = params[:course][:user_ids]
    unless user_ids.reject(&:empty?).blank?
      if @course && @course.update_attributes(user_ids: user_ids)
        redirect_to supervisor_enrollments_path, success: "Successully enroll a trainee"
      else
        flash.now[:danger] = "Please select a course!"
        render "new"
      end
    else
      flash.now[:danger] = "Please select at least one trainee!"
      render "new"
    end
  end

  def update
    respond_to do |format|
      format.js do
        enrollment = Enrollment.find params[:id]
        @user = enrollment.user
        @course = enrollment.course
        enrollment.update_attributes status: !enrollment.status
      end
    end
  end

  def destroy
    Enrollment.find(params[:id]).destroy
    flash[:success] = "Successully unenroll a trainee"
    redirect_to supervisor_enrollments_path
  end
end
