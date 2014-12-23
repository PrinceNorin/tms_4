class Supervisor::EnrollmentsController < ApplicationController
  before_action :supervisor_auth
  before_action :enrollment_check, only: :create

  def index
    @enrollments = Enrollment.all.paginate page: params[:page], per_page: 15
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new entrollment_params
    if @enrollment.save
      redirect_to supervisor_enrollments_path, success: "Successully enroll a trainee"
    else
      flash.now[:danger] = "Something went wrong!"
      render "new"
    end
  end

  def update
    respond_to do |format|
      format.js do
        enrollment = Enrollment.find params[:id]
        @user = enrollment.user
        @course = enrollment.course
        enrollment.update_attribute :status, !enrollment.status
      end
    end
  end

  def destroy
    Enrollment.find(params[:id]).destroy
    flash[:success] = "Successully unenroll a trainee"
    redirect_to supervisor_enrollments_path
  end

  private

    def entrollment_params
      params.require(:enrollment).permit(:user_id, :course_id)
    end

    def enrollment_check
      user = User.find params[:enrollment][:user_id]
      if user.enrolled? Course.find(params[:enrollment][:course_id])
        flash[:danger] = "This user has already been enrolled in this course"
        redirect_to new_supervisor_enrollment_path
      end
    end
end
