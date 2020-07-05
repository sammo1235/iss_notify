require_relative './lib/iss_notify'

task :in_range? do
  ip_address = ENV['IP_ADDRESS']
  if Location.new().in_range?(Location.new(ip_address))
    puts "You're in range!"
  else
    puts "You aren't in range!"
  end
end