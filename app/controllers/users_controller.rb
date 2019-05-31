class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    # before_action
  end

  def new
    @user = User.new

    render partial: 'form'

  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  
  def edit
    # before_action

    render partial: 'form'
  end

  def update
    # before_action
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end

  end

  def destroy
    # before_action
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
