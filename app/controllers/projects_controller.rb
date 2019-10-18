class ProjectsController < ApplicationController

    get '/projects' do
        if logged_in?
            @projects = Project.all
            erb :'projects/projects'
        else
            redirect to '/login'
        end
    end
end