class Admin::UsersController < ApplicationController
  layout "admin_layout"

  load_and_authorize_resource

  def index
    @users = User.newest.paginate page: params[:page],
      per_page: Settings.users.per_page
  end

  def show
  end
  
  def update
    if @user.update_attribute :role, params[:role]
      flash[:success] = t ".update_success", role: params[:role]
    else
      flash[:danger] = t ".update_error", role: params[:role]
    end
    redirect_to :back
  end
  
  def destroy
    if @user.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_error"
    end
    redirect_to admin_users_path
  end
end
