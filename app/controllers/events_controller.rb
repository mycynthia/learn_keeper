class EventsController < ApplicationController
  before_action :authenticate_user!
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event was successfully created"
      rediedt_to group_event_path
    else
      flash.now[:alert] = "Event was failed to create"
      render :new
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :image, :contacts, :address, :datetime, :location)
  end
end