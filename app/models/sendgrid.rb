require 'sendgrid-ruby'
include SendGrid

from Email.new(email: 'test@example.com')
subject = 'The ISS is above you!'
to = Email.new(email: 'samrhysperry93@hotmail.co.uk')
content = Content.new(type: 'text/plain', value: 'Look outside!')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers