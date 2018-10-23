class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin
  def index
    @user = User.all
    @groups = Group.all
    @events = Event.all
  end
end
