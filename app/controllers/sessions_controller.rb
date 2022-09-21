class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user.present? && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Successfully logged in!"
    else
      flash[:notice] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully Logged out."
  
  end

  private

    def session_params
      params.require(:user).permit(:email, :password)
    end
end
