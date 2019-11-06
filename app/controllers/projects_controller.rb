class ProjectsController < ApplicationController
	get '/projects' do 
		if logged_in?
			@my_projects = Project.my_projects(current_user.id)
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
		if params[:name] == "" || params[:name] == nil
			flash[:message] = 'Your project didnt have a name. Please try again!'
			redirect to 'projects/new'
		else
			@project = current_user.projects.create(name: params[:name].capitalize)

			# @project = Project.new(
			# 	:name => params[:name].capitalize,
			# 	:user_id => current_user[:id]
			# )
			# @project.save
			flash[:message] = @project.name + ' was created!'
			redirect to '/projects'
		end
	end

	get '/projects/:id' do
		if logged_in?
			@project = Project.find(params[:id])
			if @project.user_id == current_user.id
				erb :'projects/show'
			else
				flash[:message] = 'The project you tried to view does not belong to you. Please try another one!'
				redirect to 'projects'
			end
		else
			flash[:message] = 'Please log in!'
			redirect to '/login'
		end
	end

	get '/projects/:id/edit' do
		if logged_in?
			@project = Project.find(params[:id])
			if @project.user_id == current_user.id
				erb :'projects/edit'
			else
				flash[:message] = 'The project you tried to edit does not belong to you. Please try another one!'
				redirect to 'projects'
			end
		else
			flash[:message] = 'Please log in before you edit a project'
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
			if @project.user_id == current_user.id
				erb :'projects/delete'
			else
				flash[:message] = 'The project you tried to delete does not belong to you. Please try another one!'
				redirect to 'projects'
			end
		else
			flash[:message] = 'Please log in!'
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