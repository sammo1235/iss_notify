# README

Iss Notify is an API that pulls data from two different public APIs (IPStack
  and ISS Location Now) and compares your current coordinates with that of the 
  International Space Station. If both coords are within a certian range it will
  send you an email, telling you to go outside and look up!
  
  The main engine of the app is found in app/models/location.rb

* Ruby version

2.6.1

* System dependencies

gem 'sendgrid-ruby'
gem 'httparty'
gem 'pg' (to keep heroku happy)
gem 'rspec-rails'

* Configuration

When installed, you'll want to create a new credentials.yml.enc file that contains
your API key from IPStack. Assign it to an accessor called my_location_key.

Push to Heroku. Make sure you have the SendGrid and Scheduler add-ons included. 
The Scheduler will run the rake task (found in lib/tasks) every ten minutes to 
increase the chances of getting a match.

You can also run rake in_range? at the Cl to manually see if the ISS is above you.

* How to run the test suite

The test suite uses rspec, so make sure that is installed. Simply run 'rspec'
at the command line to execute it. 