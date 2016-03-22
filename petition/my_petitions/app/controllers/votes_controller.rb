class VotesController < ApplicationController

def new
    @vote = Vote.new
  end

  def create
     # byebug
    @petition = Petition.find_by(id: params[:petition_id])
 
    @vote = @petition.votes.new(vote_params)
    if @petition.votes.where(user_id: params[:user_id]).size == 0
      @vote.save
      redirect_to @petition, notice: "Спасибо за ваш голос!"
    else
     redirect_to @petition, notice: "Вы уже проголосовали!"
    end
  end
  private
  def vote_params
     # params.require(:petition).permit(:title, :text)
    params.permit(:user_id)
  end


end