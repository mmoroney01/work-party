get '/tasks/new' do
  erb :'tasks/new'
end

post '/tasks' do
  #how to pass a guest id from tasks/new to here?
  @task = Task.new(params[:task])

  if @task.save
    redirect '/tasks'
  else
    erb :'tasks/new'
  end
end
