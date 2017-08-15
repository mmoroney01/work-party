get '/:id/tasks/new' do
  @cleaning = Cleaning.find(params[:id])
  erb :'tasks/new'
end

post '/:id/tasks' do
  task_hash = params[:task]
  guest_hash = params[:guest]
  @guest = Guest.where({first_name: guest_hash[:first_name], last_name: guest_hash[:last_name]})

  @task = Task.new({description: task_hash[:description], guest_id: @guest[0].id})

  @cleaning = Cleaning.find(params[:id])

  if @task.save
    redirect "/#{@cleaning.id}/tasks/new"
  else
    erb :'tasks/new'
  end
end
