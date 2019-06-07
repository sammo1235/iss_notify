class IssNotifyMailer < ApplicationMailer
  default :from => 'iss_notify@spacemail.com'
  
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
      :subject => 'Go outside! The ISS is above you' )
  end
end
