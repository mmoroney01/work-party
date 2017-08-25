require 'twilio-ruby'

def send_message(cleaning, guest, client)
  tasks = ""
  guest.tasks.each do |task|
    if guest.tasks.last != task
      tasks += "#{task.description}, "
    else
      if guest.tasks.length == 1
        tasks += "#{task.description}"
      else
        tasks += "and #{task.description}"
      end
    end
  end

  @client.messages.create(
    from: '18722013993',
    to: "#{guest.number}",
    body: "Hello, #{guest.first_name} #{guest.last_name}. You were at my party last night, and you contributed to the mess currently in my home. I would appreciate it if, at #{@cleaning.start_time.strftime("%H:%M")} today or your earliest convenience, whichever comes first, you make your way to #{@cleaning.location} and #{tasks}."
  )
end

post '/cleanings' do
  location = params[:location]
  start = params[:start_time]
  user_id = session[:user_id]

  @cleaning = Cleaning.new(start_time: start, location: location, user_id: session[:user_id])

  if @cleaning.save
    status 200
    redirect "/cleanings/#{@cleaning.id}"
  else
    status 400
    @errors = @cleaning.errors.full_messages
    @user = User.find(session[:user_id])
    erb :'/users/show'
  end
end

get '/cleanings/:id' do
  @cleaning = Cleaning.find(params[:id])
  @user = User.find(@cleaning.user_id)
  if session[:user_id] == @user.id
    erb :'/cleanings/show'
  end
end

get '/cleanings/:id/edit' do
  @cleaning = Cleaning.find(params[:id])

  if @cleaning.user_id == session[:user_id]
    if request.xhr?
      return erb :'/cleanings/_edit', layout: false
    else
      #else?
    end
  end
end

put '/cleanings/:id' do
  @cleaning = Cleaning.find(params[:id])
  @cleaning.assign_attributes(params[:cleaning])

  if request.xhr?
    if @cleaning.save
      return "You have scheduled a work party at #{@cleaning.location} that starts at #{@cleaning.start_time.strftime("%H:%M")}."
    else
      errors = @cleaning.errors.full_messages
      erb :'/cleanings/edit'
    end
  else
     p "oh, well"
  end
end

delete '/cleanings/:id' do
  @cleaning = Cleaning.find(params[:id])
  @user = User.find(@cleaning.user_id)

  if session[:user_id] == @user.id
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['REST_API']
    @client = Twilio::REST::Client.new account_sid, auth_token

    @cleaning.guests.each do |guest|
      send_message(@cleaning, guest, @client)
    end

    @cleaning.destroy
    redirect "/users/#{session[:user_id]}"
  end
end

#not RESTful, but the first delete sends out the texts, this delete deletes the work party without sending out texts.
delete '/cleanings/:id/delete' do
  @cleaning = Cleaning.find(params[:id])
  @cleaning.destroy
  redirect "/users/#{session[:user_id]}"
end




