require 'pry'
class ProjectsController < ApplicationController
	get '/projects' do
		if logged_in?
			@projects = Project.all
			@tasks = Task.all
			erb :'projects/projects'
		else
			redirect to '/login'
		end
	end

	get '/newproject' do
		if logged_in?
			erb :'projects/create_project'
		else
			redirect to '/login'
		end
	end

	post '/createproject' do
		@project = Project.new(
			:name => params[:name].capitalize,
			:user_id => current_user[:id]
		)
		@project.save
		redirect to '/projects'
	end

	get '/projects/:id' do
		if logged_in?
			@project = Project.find(params[:id])
			erb :'projects/show'
		else
			redirect to '/login'
		end
	end
end