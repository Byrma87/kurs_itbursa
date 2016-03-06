class PetitionsController < ApplicationController
  
  def index

  end

  def show
  @petition = Petition.find(params[:id])
  # render json:@petition
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = Petition.new(petition_params)
    redirect_to root_url
  end

  def edit

  end

  def update

  end

  def destroy

  end
  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end