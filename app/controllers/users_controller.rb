class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    authorize @user
    authorize @users
  end

  def show
    @user = User.find_by(params[:id])
    # binding.pry
    # authorize @user
    redirect_to users_path, alert: "Access denied." unless current_user == @user || current_user.admin?
  end

  def new

  end

  def create

  end

  def edit

  end

  def update
    @user = User.find_by(params[:id])
    @user.update(user_params)
    authorize @user
  end

  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

end
