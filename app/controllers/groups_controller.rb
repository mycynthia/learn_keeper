class GroupsController < ApplicationController
  before_action :set_group, only: [:members, :gphotos]
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
  def groupedit_members

  end
  def groupedit_photos
    
  end
  def groupedit_about
    
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, :description)
  end
  def set_group
    @group = Group.find(params[:id])
  end
end
