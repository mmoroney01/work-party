get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])

  if @user
    status 200
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 400
    @error = "Username and/or password invalid."
    erb :'/sessions/new'
  end
end

delete '/sessions/:id' do
  session[:user_id] = nil
  redirect '/'
end
