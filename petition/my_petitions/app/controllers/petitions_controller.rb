class PetitionsController < ApplicationController
  before_action :autorize_user, only: [:new, :create]
  
  def index
    @petitions = Petition.all
    @petitions = @petitions.where(user_id: current_user) if params[:my]
  end

  def show
  @petition = Petition.find(params[:id])
  # render json:@petition
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = current_user.petitions.new(petition_params)
    if @petition.save
      redirect_to @petition
    else
    render 'new'
    end
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