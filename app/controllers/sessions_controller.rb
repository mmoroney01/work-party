get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])

  if @user
    session[:id] = @user.id
    redirect "users/#{@user.id}"
  else
    erb :failed_login
  end
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end
