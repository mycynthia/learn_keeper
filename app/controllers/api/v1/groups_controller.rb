class Api::V1::GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def show
    @groups = Group.all
  end
end
