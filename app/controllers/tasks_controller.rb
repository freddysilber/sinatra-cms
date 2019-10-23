class TasksController < ApplicationController
    get '/tasks' do
        if logged_in?
            @tasks = Task.all
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
            :name => params[:name],
            :project_id => params[:project_id]
        )
        @task.save
        redirect to '/tasks'
    end
end