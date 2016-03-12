class PetitionsController < ApplicationController
  before_action :autorize_user, only: [:new, :create]
  
  def index
    @petitions = Petition.all
    @petitions = current_user.petitions if params[:my]

  end

  def show
  @petition = Petition.find(params[:id])
  # byebug
  @votes = @petition.votes.size
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
    # byebug
    @petition = Petition.find(params[:id])
  end

  def update
    @petition = Petition.find(params[:id])

    if @petition.update(petition_params)
      # flash.now[:notice] = "Петиция обновлена"
      redirect_to @petition, notice: 'Петиция изменена'
    else
      render 'edit'
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy
    redirect_to @petition, notice: 'Петиция удалена'
  end
  def petition_params
    params.require(:petition).permit(:title, :text)
  end
end