class Supervisor::TasksController < ApplicationController
  before_action :supervisor_auth
  before_action :set_subject

  def new
    @task = @subject.tasks.build
  end

  def create
    @task = @subject.tasks.build task_params
    if @task.save
      flash[:success] = "New task has been added to this subject!"
      redirect_to new_supervisor_subject_task_path(@subject)
    else
      flash.now[:danger] = "Something went wrong!"
      render "new"
    end
  end

  private

    def set_subject
      @subject = Subject.find params[:subject_id]
    end

    def task_params
      params.require(:task).permit(:name)
    end
end
