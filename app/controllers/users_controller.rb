class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update] 
  def show
    @user = User.find(params[:id])
    @labels = @user.labels.sort_by { |k| k["name"] }
  end
  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  def update
    @user.update(user_params)
    redirect_to user_path
  end
  def destroy
    delete_target_user = User.find(params[:id])
    delete_target_user_id = delete_target_user.id
    if current_user.admin? or current_user == delete_target_user
      if delete_target_user.destroy
        redirect_to admin_root_path, \
          notice: "User ID:" + delete_target_user_id.to_s + " has been deleted."
        # TODO: Display the error message if failed
      end
      # TODO: Handler the output of self-deleting
    else
      redirect_to root_path, alert: "Not allow!"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
