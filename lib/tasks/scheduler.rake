desc "Task for Heroku scheduler: email when in_range? == true"
task :in_range? => :environment do
  if MyLocation.new.in_range?(MyLocation.new)
    IssNotifyMailer.send_iss_email
    puts "Sending email"
  else
    puts "Iss not above"
  end
end
