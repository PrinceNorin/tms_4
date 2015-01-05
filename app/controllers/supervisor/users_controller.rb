class Supervisor::UsersController < ApplicationController
  before_action :supervisor_auth
  before_action :redirect_if_other_supervisors, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to supervisor_users_path, success: "Successfully added new user!"
    else
      flash.now[:danger] = "Something went wrong!"
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to supervisor_users_path, success: "Successfully updated user!"
    else
      flash.now[:danger] = "Something went wrong!"
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to supervisor_users_path, success: "Successfully deleted user!"
  end

  private

    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                        :password_confirmation, :supervisor)
    end
end
