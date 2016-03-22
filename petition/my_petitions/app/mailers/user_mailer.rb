class UserMailer < ApplicationMailer
  def mails_petition_approved(petition)
    @petition = petition
    @user = petition.user
    mail to: @user.email, subject: 'petition_approved' 
  end

  def mails_petition_approved_admin(petition)
    @petition = petition
    @user = petition.user
    mail to: 'admin@petition.com', subject: 'petition_approved' 
  end

  def mails_petition_unapproved(petition)
    @petition = petition
    @user = petition.user
    # byebug
    mail to: @user.email, subject: 'petition_unapproved' 
  end
end
