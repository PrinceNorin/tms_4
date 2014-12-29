class Supervisor::SessionsController < ApplicationController
  before_action :redirect_signed_in_user, except: [:destroy]
  
  def new
  end
  
  def create
    user = User.find_by_name params[:session][:name]
    if user && user.authenticate(params[:session][:password]) && user.supervisor?
      sign_in user
      remember_me? ? remember(user) : forget(user)
      redirect_back_or_to supervisor_root_path, success: "You have signed in."
    else
      flash.now[:danger] = "You must be a supervisor to signin this page!"
      render "new"
    end
  end
  
  def destroy
    sign_out if user_signed_in?
    redirect_to root_path, success: "You have signed out."
  end

  private

    def remember_me?
      params[:session][:remember_me] == "1" 
    end
end
