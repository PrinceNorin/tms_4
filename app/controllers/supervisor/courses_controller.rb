class Supervisor::CoursesController < ApplicationController
  before_action :supervisor_auth
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all.paginate page: params[:page], per_page: 15
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      redirect_to supervisor_root_path, success: "A new course has been added!"
    else
      flash.now[:danger] = "Something went wrong!"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update_attributes course_params
      redirect_to supervisor_root_path, success: "Course has been updated!"
    else
      flash.now[:danger] = "Something went wrong!"
      render "edit"
    end
  end

  def destroy
    @course.destroy
    redirect_to supervisor_root_path, success: "One course has been remove!"
  end

  private

    def set_course
      @course = Course.find params[:id]
    end

    def course_params
      params.require(:course).permit(:user_id, :name, :description,
                              :status, :duration, :subject_ids => [])
    end

    
end
