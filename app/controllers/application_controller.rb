# require './config/environment'

class ApplicationController < Sinatra::Base
	configure do
		register Sinatra::Flash
		set :views, "app/views"
		set :public_folder, 'public'
		enable :sessions
		set :session_secret, "freddy_secret"
	end
  
	get '/' do
		@my_projects = []
		@my_tasks = []
		Project.all.each do |p|
			if p.user_id == current_user.id
				@my_projects << p
			end
		end
		Task.all.each do |t|
			if t.user_id == current_user.id
				@my_tasks << t
			end
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