class Admin::EventsController < ApplicationController
  before_action :authenticate_admin

  def index
  end
end
