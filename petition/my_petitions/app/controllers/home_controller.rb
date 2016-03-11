class HomeController < ApplicationController
  # before_acton :
  def index
    @petitions = Petition.all.order(created_at: :desc).limit(10)
  end


end