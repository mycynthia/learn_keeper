class Admin::GroupsController < ApplicationController
  def index
    @user = User.all
  end
end