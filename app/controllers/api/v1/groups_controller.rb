class Api::V1::GroupsController < ApiController
  def index
    @groups = Group.all
  end
  def show
    @groups = Group.all
  end
  def create
    # create new group
    @group = Group.new()
    group_params
    @group.name = params[:name]
    @group.image = params[:image]
    @group.location = params[:location]
    @group.description = params[:description]
    @group.user = current_user
    groupLabels = JSON.parse(params[:selectedLabels])
    @group_labels = Array.new
    # save new group
    if @group.save! #create group labels if group created successfully
      # add current user to group_records
      group_record = @group.group_records.build()
      group_record.user = current_user
      group_record.save!
      # add selected labels to label_groups
      groupLabels.each do |label|
        obj = Label.find(label["id"])
        if obj
          group_label = @group.label_groups.build()
          group_label.label = obj
          group_label.save!
          @group_labels.push(group_label)
        end
      end
      render json:{
        group:@group.as_json(except:[:created_at,:updated_at]),
        group_labels:@group_labels.as_json(except:[:created_at,:updated_at]),
        message:"OK"
      }
    else
      render json:{
        errors: @group.errors
      }
    end

  end

  private

  def group_params
    params.permit(:name,:image,:description,:location,:selectedLabels)
  end
end
