get '/:id/tasks/new' do
  @cleaning = Cleaning.find(params[:id])
  @guests = @cleaning.guests

  # p '*' * 80
  # p @cleaning
  # p '*' * 80
  # p Guest.last
  # p '*' * 80
  # p CleaningGuest.last
  # p '*' * 80
  # p @guests
  # p '*' * 80
#  @tasks = @cleaning.tasks

  erb :'tasks/new'
end

post '/:id/tasks' do
  task_hash = params[:task]
  guest_hash = params[:guest]

  #finds an existing guest, if there is one
  @guest = Guest.where({first_name: guest_hash[:first_name], last_name: guest_hash[:last_name], number: guest_hash[:number]})

  #if the guest doesn't already exist, make a new one and save it
  if @guest.empty?
    @guest = Guest.new({first_name: guest_hash[:first_name], last_name: guest_hash[:last_name], number: guest_hash[:number]})
    @guest.save
  end

  #reassign @guest to the guest that was just saved.
  @realguest = Guest.where({first_name: guest_hash[:first_name], last_name: guest_hash[:last_name], number: guest_hash[:number]})

  #make a new task object associated with the guest.
  @task = Task.new({description: task_hash[:description], guest_id: @realguest[0].id})

  #find the work party that we're current assigning tasks for.
  @cleaning = Cleaning.find(params[:id])


  #make a new cleaningguest instance, find a way to do without this join table IF TIME.
  @cleaningguest = CleaningGuest.new(cleaning_id: @cleaning.id, guest_id: @realguest[0].id)
  @cleaningguest.save

  if @task.save
    redirect "/#{@cleaning.id}/tasks/new"
  else
    erb :'tasks/new'
  end
end
