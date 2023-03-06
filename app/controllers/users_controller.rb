class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:edit, :update]

  def show
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    redirect_to root_path unless @user == current_user
    flash[:notice] = "You must be logged in to do this"
  end

  def user_params
    params.require(:user)
          .permit(:avatar, :first_name, :last_name, :username, :bio)
  end
end