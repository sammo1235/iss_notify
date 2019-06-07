desc "Task for Heroku scheduler: email when in_range? == true"
task :in_range? => :environment do
  if MyLocation.new.in_range?(Isslocation.new)
    IssNotifyMailer.send_notify_email("samrhysperry93@hotmail.co.uk").deliver
  else
    "don't"
  end
end
