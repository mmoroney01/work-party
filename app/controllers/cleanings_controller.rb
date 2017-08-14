#Start a new work party.

post '/cleanings/' do
  @cleaning = Cleaning.new(params[:cleaning])

  if @cleaning.save
    redirect '/tasks/new'
  else
    #tell them it didn't work
    redirect "/users/#{session[:id]}"
  end
end
