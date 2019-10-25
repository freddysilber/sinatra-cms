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

	get '/newtask' do
		if logged_in?
			@projects = Project.all
			erb :'tasks/create_task'
		else
			redirect to '/login'
		end
	end

	post '/createtask' do
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
end