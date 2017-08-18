#Start a new work party.

post '/cleanings' do
  @cleaning = Cleaning.new(params[:cleaning])

  if @cleaning.save
    redirect "/#{@cleaning.id}/tasks/new"
  else
    #tell them it didn't work
    redirect "/users/#{session[:id]}"
  end
end

delete '/cleanings/:id' do
  p params
  @cleaning = Cleaning.find(params[:id])

  #TWILIO LOGIC GOES HERE, SEND OUT ALL MESSAGES

  @cleaning.destroy

  redirect '/users/#{session[:id]'
end
