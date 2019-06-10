class IssNotifyMailer < ApplicationMailer
  default :from => 'iss_notify@spacemail.com'
  
  def send_iss_email(email)
    mail( :to => email,
      :subject => 'Go outside! The ISS is above you' )
  end
end
