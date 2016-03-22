class Petition < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  # atrr_accessor :petition
  validates :title, presence: true, length: { minimum: 3}
  validates :text, presence: true, length: { minimum: 5}
#   validates :date_vadidates, on: :update

# def date_validates
#   byebug
#   # if created_at < Date.today
#   # if 8 == 8
 
#  # end
# end
  def expired_days(petition)
    # byebug
    (Date.today - petition.created_at.to_date > EXPIRED_DAYS)
  end

  def petition_approved(petition)
    (expired_days(petition) && 
       petition.votes.size >= MIN_VOITES)
     # byebug
  end

  def petition_unapproved(petition)
    (Date.today - petition.created_at.to_date > EXPIRED_DAYS && 
       petition.votes.size < MIN_VOITES)
  end
  
end