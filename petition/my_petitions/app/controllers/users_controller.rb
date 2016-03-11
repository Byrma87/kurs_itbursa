class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      # byebug
      # render json: user_params[:password]
      if user_params[:password] == params[:user][:password_confirmation]
        @user.save
        session[:user_id] = @user.id
        redirect_to  root_url, notice: "Cпасибо за регистрацию"
      else
        render "new"
      end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end