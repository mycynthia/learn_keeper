class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update] 
  def show
    @user = User.find(params[:id])
  end
  def edit
    unless @user == current_user
      rediredt_to user_path(@user)
    end
  end
  def update
    @user.update(user_params)
    rediredt_to user_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name)
  end
end
