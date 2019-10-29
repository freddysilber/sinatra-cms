require 'pry'
class ProjectsController < ApplicationController
	get '/projects' do 
		if logged_in?
			@my_projects = Project.my_projects(current_user.id)
			# @tasks = Task.all
			# @projects = Project.all
			erb :'projects/projects'
		else
			flash[:message] = 'PLEASE LOG IN BEFORE YOU VIEW YOUR PROJECTS.'
			redirect to '/login'
		end
	end

	get '/projects/new' do
		if logged_in?
			erb :'projects/new'
		else
			flash[:message] = 'Please log in before you create a new project.'
			redirect to 'login'
		end
	end

	post '/projects' do
		@project = Project.new(
			:name => params[:name].capitalize,
			:user_id => current_user[:id]
		)
		@project.save
		flash[:message] = @project.name + ' was created!'
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

	get '/projects/:id/edit' do
		if logged_in?
			@project = Project.find(params[:id])
			erb :'projects/edit'
		else
			flash[:message] = 'Please log int before you edit a project'
			redirect to 'login'
		end
	end

	patch '/projects/:id' do
		@project = Project.find(params[:id])
		@project.name = params[:name]
		@project.save
		redirect to "/projects/#{@project.id}"
	end

	get '/projects/:id/delete' do
		if logged_in?
			@project = Project.find(params[:id])
			erb :'projects/delete'
		else
			redirect to 'login'
		end
	end

	delete '/projects/:id/delete' do
		@project = Project.find(params[:id])
		tasks = Task.all
		tasks.each do |t|
			if t.project_id == @project.id
				t.delete
			end
		end
		@project.delete
		redirect to '/projects'
	end
end