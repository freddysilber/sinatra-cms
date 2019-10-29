require 'pry'
class TasksController < ApplicationController
	get '/tasks' do
		if logged_in?
			@tasks = Task.all
			@projects = Project.all
			erb :'tasks/tasks'
		else
			redirect to '/login'
		end
	end

	get '/tasks/new' do
		if logged_in?
			@projects = Project.all
			erb :'tasks/new'
		else
			redirect to '/login'
		end
	end

	post '/tasks' do
		@task = Task.new(
			:name => params[:name].capitalize,
			:project_id => params[:project_id],
			:user_id => current_user[:id],
			:complete => params[:complete] == 'on' ? true : false,
			:due_date => params[:due_date]
		)
		@task.save
		redirect to '/tasks'
	end

	get '/tasks/:id' do
		if logged_in?
			@task = Task.find(params[:id])
			erb :'tasks/show'
		else
			redirect to '/login'
		end
	end

	get '/tasks/:id/edit' do
		if logged_in?
			@task = Task.find(params[:id])
			erb :'tasks/edit'
		else
			flash[:message] = 'Please log int before you edit a task'
			redirect to 'login'
		end
	end

	patch '/tasks/:id' do
		@task = Task.find(params[:id])
		@task.name = params[:name]
		@task.save
		redirect to "/tasks/#{@task.id}"
	end

	get '/tasks/:id/delete' do
		if logged_in? 
			@task = Task.find(params[:id])
			erb :'tasks/delete'
		else
			redirect to 'login'
		end
	end

	delete '/tasks/:id/delete' do
		@task = Task.find(params[:id])
		@task.delete
		redirect to '/tasks'
	end
end