class TasksController < ApplicationController
	get '/tasks' do
		if logged_in?
			@my_tasks = Task.my_tasks(current_user.id)
			erb :'tasks/tasks'
		else
			flash[:message] = 'Please log in!'
			redirect to '/login'
		end
	end

	get '/tasks/new' do
		if logged_in?
			@my_projects = Project.my_projects(current_user.id)
			erb :'tasks/new'
		else
			flash[:message] = 'Please log in!'
			redirect to '/login'
		end
	end

	post '/tasks' do
		if params[:name] == "" || params[:project_id] == ""
			flash[:message] = 'The task you submitted is missing a name or a project.'
			redirect to 'tasks/new'
		else
			@task = Task.new(
				:name => params[:name].capitalize,
				:project_id => params[:project_id],
				:user_id => current_user[:id],
				:complete => params[:complete] == 'on' ? true : false,
				:due_date => params[:due_date]
			)
			@task.save
			flash[:message] = @task.name + ' was created!'
			redirect to 'tasks'
		end
	end

	get '/tasks/:id' do
		if logged_in?
			@task = Task.find(params[:id])
			if @task.user_id == current_user.id
				erb :'tasks/show'
			else
				flash[:message] = 'The task you tried to view does not belong to you. Please try another one!'
				redirect to 'tasks'
			end
		else
			flash[:message] = 'Please log in!'
			redirect to '/login'
		end
	end

	get '/tasks/:id/edit' do
		if logged_in?
			@task = Task.find(params[:id])
			if @task.user_id == current_user.id
				erb :'tasks/edit'
			else
				flash[:message] = 'The task you tried to edit does not belong to you. Please try another one!'
				redirect to 'tasks'
			end
		else
			flash[:message] = 'Please log in before you edit a task'
			redirect to 'login'
		end
	end

	patch '/tasks/:id' do
		@task = Task.find(params[:id])
		@task.name = params[:name]
		@task.due_date = params[:due_date]
		@task.complete = params[:complete]
		@task.save
		redirect to "/tasks/#{@task.id}"
	end

	get '/tasks/:id/delete' do
		if logged_in? 
			@task = Task.find(params[:id])
			if @task.user_id == current_user.id
				erb :'tasks/delete'
			else
				flash[:message] = 'The task you tried to delete does not belong to you. Please try another one!'
				redirect to 'tasks'
			end
		else
			flash[:message] = 'Please log in!'
			redirect to 'login'
		end
	end

	delete '/tasks/:id/delete' do
		@task = Task.find(params[:id])
		@task.delete
		redirect to '/tasks'
	end
end