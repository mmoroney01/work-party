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
  #because the cleaning ids start at zero
  # id = (params[:id].to_i - 1).to_s
  # @cleaning = Cleaning.find(id)

  #TWILIO LOGIC GOES HERE, SEND OUT ALL MESSAGES

  @cleaning.destroy

  redirect '/users/#{session[:id]'
end
