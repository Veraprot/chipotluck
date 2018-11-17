class EventsController < ApplicationController

  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :create,:edit,:destroy]
  

  # def index
  #   @events = Event.all
  #   #TODO Search function
  # end 

  def index 
    @events = Event.search(params[:search])
  end

  def new
    @event = Event.new
  end

  def show
    # before_action finds the instance
  end

  def time_format(string)
    string.strftime()
  end

  def create
    @user = current_user
    @event = Event.new(event_params)
    @event.user_host_id = @user.id
    @event.format_time(params[:event])
    # @event.user  = current_user #that devise magic
    if @event.valid?
      @event.save
      @event_user = EventUser.create(event_id: @event.id, user_id: current_user.id)
      redirect_to @event
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end

  def edit
    # before_action finds the instance
  end

  def update
    # before_action finds the instance
    @event.update(event_params)
    redirect_to @event
  end

  def destroy
    if @event.user_host_id == current_user.id
      @event.destroy    
      redirect_to events_path
    else 
      redirect_to events_path
    end 
  end

  private

    def event_params
      params.require(:event).permit(:name,:date,:description,:location, :user_host_id,:search)
    end

    def find_event
      @event = Event.find_by(id: params[:id])
    end

end # END OF EVENTS CONTROLLER
