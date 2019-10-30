class ApplicationController < Sinatra::Base
	configure do
		register Sinatra::Flash
		set :views, "app/views"
		set :public_folder, 'public'
		enable :sessions
		set :session_secret, "freddy_secret"
	end
  
	get '/' do
		if logged_in?
			@my_projects = Project.my_projects(current_user.id)
			@my_tasks = Task.my_tasks(current_user.id)
		end
		erb :index
	end

	helpers do
		def logged_in?
			!!current_user
		end
		
		def current_user
			@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
		end
	end
end