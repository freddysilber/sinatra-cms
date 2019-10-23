class ProjectsController < ApplicationController
    get '/projects' do
        if logged_in?
            @projects = Project.all
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
            :name => params[:name],
            :user_id => current_user[:id]
        )
        @project.save
        redirect to '/projects'
    end
end