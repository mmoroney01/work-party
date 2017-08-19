get '/:id/tasks/new' do
  @cleaning = Cleaning.find(params[:id])
  @guests = @cleaning.guests
  erb :'tasks/new'
end

post '/:id/tasks' do
  task_hash = params[:task]
  guest_hash = params[:guest]

  @guest = Guest.find_or_initialize_by({first_name: guest_hash[:first_name], last_name: guest_hash[:last_name], number: guest_hash[:number]})

  @guest.save

  @task = Task.new({description: task_hash[:description], guest_id: @guest.id})

  @cleaning = Cleaning.find(params[:id])

  @cleaningguest = CleaningGuest.new(cleaning_id: @cleaning.id, guest_id: @guest.id)
  @cleaningguest.save

  if request.xhr?
    if @task.save
      return erb :"/tasks/_guestspartial", layout: false, locals: {guest: @guest, task: @task}
    else
      status 422
    end
  else
    status 404
    redirect "/#{@cleaning.id}/tasks/new"
  end
end
