class GroupsController < ApplicationController
  def index
    
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "Group was successfully created"
      rediredt_to group_path
    else
      flash.now[:alert] = "Group was failed to create"
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, :description)
  end
end
