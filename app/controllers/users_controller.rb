class UsersController < ApplicationController
  # before_action :find_user, only: [:edit, :update, :show]
  before_action :find_user, only: [:show]

  def show
    # before_action finds the instance
  end

  def new
    @user = User.new
  end

  def create
   @user = User.create(user_params)
    #TODO Add validation
  end

  def profile
    current_user 
  end

  private

    def find_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end

end
