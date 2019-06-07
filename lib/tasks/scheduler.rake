desc "Task for Heroku scheduler: email when in_range? == true"
task :in_range? => :environment do
  if MyLocation.new.in_range?(Isslocation.new)
    "send email"
  else
    "don't"
  end
end
