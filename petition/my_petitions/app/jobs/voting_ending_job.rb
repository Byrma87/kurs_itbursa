class VotingEndingJob < ActiveJob::Base
  queue_as :default

  def perform
  Petition.all.each do |e| 
    if e.petition_approved(e)
      UserMailer.mails_petition_approved(e).deliver_later
      UserMailer.mails_petition_approved_admin(e).deliver_later
      # byebug
    end
    if e.petition_unapproved(e)
      UserMailer.mails_petition_unapproved(e).deliver_later
      # byebug
    end
   end # Do something later
  end
end
