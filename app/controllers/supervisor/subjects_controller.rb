class Supervisor::SubjectsController < ApplicationController
  before_action :supervisor_auth
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Successfully add new subject!"
      redirect_to supervisor_subjects_path
    else
      flash.now[:danger] = "Something went wrong!"
      render "new"
    end
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = "Successfully updated subject!"
      redirect_to supervisor_subjects_path
    else
      flash.now[:danger] = "Something went wrong!"
      render "edit"
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = "Successfully delete subject!"
    redirect_to supervisor_subjects_path
  end

  private

    def set_subject
      @subject = Subject.find params[:id]
    end

    def subject_params
      params.require(:subject).permit(:name, tasks_attributes: [:id, :name, :_destroy])
    end
end
