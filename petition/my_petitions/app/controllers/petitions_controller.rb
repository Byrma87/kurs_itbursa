class PetitionsController < ApplicationController
  
  def index

  end

  def show
  @petition = Petition.find(params[:id])
  # render json:@petition
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end