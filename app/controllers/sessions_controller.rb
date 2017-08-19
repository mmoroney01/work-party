get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])

  if @user
    status 200
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 400
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end
