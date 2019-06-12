desc "Task for Heroku scheduler: email when in_range? == true"
task :in_range? => :environment do
  if Location.new(Rails.application.credentials.aws[:my_location_key])
    .in_range?(Location.new('http://api.open-notify.org/iss-now.json'))
    IssNotifyMailer.send_iss_email(Rails.application.credentials.aws[:email]).deliver_now
    puts "Sending email"
  else
    puts "Iss not above"
  end
end
