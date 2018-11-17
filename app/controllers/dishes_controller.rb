class DishesController < ApplicationController
  before_action :find_dish, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create,:edit,:destroy]

  def index
    @dishes = Dish.all
  end

  def show
    # before_action finds the instance
    @recipe_results = PuppyRecipeApi.query(@dish.name)

  end

  def edit
    # before_action finds the instance
  end

  def update
    # before_action finds the instance
    @dish.update(dish_params)
    redirect_to @dish
  end

  def destroy
    # before_action finds the instance
    @dish.destroy
    redirect_to events_path
  end

  def new
    @dish = Dish.new
    # render :new
  end

  def create
    @event = Event.find_by(id: params[:id])
    @dish = Dish.new(dish_params)
    # byebug
    if @dish.valid?
      @dish.save
      redirect_to event_path(@dish.event_id)
    else
      flash[:errors] = @dish.errors.full_messages
      redirect_to new_dish_path
    end
  end


  private

  def dish_params
    params.require(:dish).permit(:name, :description, :event_id, :user_id)
  end

  def find_dish
    @dish = Dish.find_by(id: params[:id])
  end
end # end of controller
