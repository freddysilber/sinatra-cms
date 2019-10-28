require 'pry'
class ProjectsController < ApplicationController
	get '/projects' do 
		if logged_in?
			@projects = Project.all
			@tasks = Task.all
			flash[:message] = 'PLEASE LOG IN BEFORE YOU VIEW YOUR PROJECTS.'
			# @message = 
			erb :'projects/projects'
		else
			flash[:message] = 'PLEASE LOG IN BEFORE YOU VIEW YOUR PROJECTS.'
			redirect to '/login'
		end
	end
# projects/new
	get '/newproject' do
		if logged_in?
			erb :'projects/create_project'
		else
			redirect to '/login'
		end
	end
# projects
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