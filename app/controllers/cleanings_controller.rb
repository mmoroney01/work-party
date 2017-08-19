post '/cleanings' do
  @cleaning = Cleaning.new(params[:cleaning])

  if @cleaning.save
    status 200
    redirect "/#{@cleaning.id}/tasks/new"
  else
    status 400
    @errors = @cleaning.errors
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
