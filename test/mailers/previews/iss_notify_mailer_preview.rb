class IssNotifyMailerPreview < ActionMailer::Preview
  def iss_notify_mailer_preview
    IssNotifyMailer.send_iss_email("samrhysperry93@hotmail.co.uk")
  end
end