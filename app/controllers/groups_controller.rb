class GroupsController < ApplicationController
  before_action :set_group, only: [:members, :gphotos, :show, :join, :leave]
  def index
    
  end
  def new
    @group = Group.new
    @labels = Label.all
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "Group was successfully created"
      redirect_to group_path
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
  def join
      group_record = @group.group_records.build()
      group_record.user = current_user
      if group_record.save!
        flash[:notice] = "You are successfully join the group '#{@group.name}'"
        redirect_back(fallback_location: root_path)
      end
  end
  def leave
    group_record = GroupRecord.where(group:@group,user:current_user)
    if group_record.size > 0
      if group_record.destroy_all
        flash[:notice] = "You left the group '#{@group.name}'"
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = "Error occurred when leaving group"
      end
    end
  end
  def show
    obj = GroupRecord.where(group:@group,user:current_user)
    if obj.size < 1
      @canJoin = true
    else
      @canJoin = false
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, :description)
  end
  def set_group
    @group = Group.find(params[:id])
  end
end
