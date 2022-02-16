class EventsController < ApplicationController
  before_action :make_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events =  Events.all
  end

  def new
    # @event = Event.new
  end

  def show
    # @event = Event.find_by_id(params[:id])
  end

 

  def create
    @event = Event.create(input_params)
    @event.user = current_user 
    if @event.save
      flash[:notice] = "Event Successfully created by user"
      redirect_to events_path 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(input_params)
      flash[:notice] = "Event is successfully updated by user"
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.destroy 
    redirect_to customer_path
  end

  private

  def make_event
    @event = Event.(params[:id])
  end

  def input_params 
    params.require(:event).permit(:name, :description, :event_date)
  end

end
