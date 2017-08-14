get '/tasks/new' do
  erb :'tasks/new'
end

post '/tasks' do
  task_hash = params[:task]
  guest_hash = params[:guest]
  @guest = Guest.where({first_name: guest_hash[:first_name], last_name: guest_hash[:last_name]})

  @task = Task.new({description: task_hash[:description], guest_id: @guest[0].id})

  if @task.save
    redirect '/tasks'
  else
    erb :'tasks/new'
  end
end
