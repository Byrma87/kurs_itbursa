class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
      # render json: user.password
    if user && user.password == params[:password]
       session[:user_id] = user.id
       redirect_to root_url, notice: "Залогинились" 
     else
       flash.now.alert = "Не вырный логин либо пароль" 
       render "new"
     end
  end


  def destroy
    session[:user_id] = nil
      redirect_to root_url, notice: "Разлогинились"
  end
end