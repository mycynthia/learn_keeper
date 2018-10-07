class Api::V1::GroupsController < ApiController
  def index
    @groups = Group.all
  end
  def show
    @groups = Group.all
  end
end
