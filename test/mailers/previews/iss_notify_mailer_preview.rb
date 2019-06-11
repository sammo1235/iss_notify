class IssNotifyMailerPreview < ActionMailer::Preview
  def iss_notify_mailer_preview
    IssNotifyMailer.send_iss_email(Rails.application.credentials.aws[:email])
  end
end