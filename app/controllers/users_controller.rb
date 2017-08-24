get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    status 200
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 400
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @cleanings = Cleaning.where("user_id = '#{@user.id}'")
  erb :'/users/show'
end
