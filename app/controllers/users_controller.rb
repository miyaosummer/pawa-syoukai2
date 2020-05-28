class UsersController < ApplicationController

  before_action :set_user, only:[:edit,:show]

  def index
  end

  def new
    @user = User.new
  end

  def create
    User.create(post_params)
    redirect_to user_path(current_user.id)
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    user.update(post_params)
    redirect_to user_path(current_user.id)
  end

  def show
    @specials = Special.all
    @basics = Basic.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def post_params
    params.require(:user).permit(:nickname,:image)
  end

  def set_user
    @user = User.find(params[:id])
  end
    
end
