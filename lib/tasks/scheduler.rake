desc "Task for Heroku scheduler: email when in_range? == true"
task :in_range? => :environment do
  if MyLocation.new.in_range?(IssLocation.new)
    IssNotifyMailer.send_iss_email(Rails.application.credentials.aws[:email]).deliver_now
    puts "Sending email"
  else
    puts "Iss not above"
  end
end
