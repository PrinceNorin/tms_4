class CoursesController < ApplicationController
  before_action :user_auth
  before_action :set_course, only: :show
  before_action :enrolled_check, only: :show

  def index
    @courses = Course.all.paginate page: params[:page], per_page: 15
  end

  def show
    @course = Course.find params[:id]
  end

  private

    def set_course
      @course = Course.find params[:id]
    end

    def enrolled_check
      unless current_user.enrolled? @course
        message = "You are not enrolled in this course. 
                   Please contact your suppervisor!"
        redirect_to root_path, danger: message
      end
    end
end
