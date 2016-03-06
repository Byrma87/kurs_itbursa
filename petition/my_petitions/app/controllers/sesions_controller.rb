class SesionsController < ApplicationController
  
  def index
    @petitions = Petition.all
  end

  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_ root_url, notice: "Залогинились"
    else
      flash.now.alert = "Что то не подошло"
      render "new"
    end
  end

  def show
 @petitions = Petition.all
 end
end