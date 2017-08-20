require 'twilio-ruby'

account_sid = 'AC1ed068dc6c7d93f97f927d064031758e'
auth_token = 'dc9591ac96229ac7271edba16a26befe'
@client = Twilio::REST::Client.new account_sid, auth_token

@client.messages.create(
  from: '',
  to: '',
  body: 'great job'
)
