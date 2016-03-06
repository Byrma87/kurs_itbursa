class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
   @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    # render json: params[:user][:password_confirmation]
     # if @user_params.password == @user_params.password_confirmation
    redirect_to  sesion_path(user)
       # render "new"
     # end
  end

  def edit

  end

  def update

  end

  def destroy

  end
  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end