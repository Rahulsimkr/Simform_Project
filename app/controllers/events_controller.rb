class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end


  
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      flash[:notice] = "Event Suceesfully created"
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  def search
    if params[:query].present?
      @event_search = Event.where("category_id LIKE '%#{params[:query]}%'") 
    end
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event Successfully edited"
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def profile
    @user = current_user
    @events = Event.all
    @enroll_events = @user.enrollments.all
  end

  def add_comments
    Event.find(params[:event_id]).comments.create("body" => params[:body])
    redirect_to event_path(id: params[:event_id])
  end

  private

  def find_event
    @event = Event.find_by_id(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :user_id, :category_id)
  end
end
