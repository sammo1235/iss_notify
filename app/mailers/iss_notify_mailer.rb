class IssNotifyMailer < ApplicationMailer
  default :from => 'iss_notify@spacemail.com'
  
  def send_iss_email
    mail( :to => "samrhysperry93@hotmail.co.uk",
      :subject => 'Go outside! The ISS is above you' )
  end
end
