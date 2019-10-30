class UsersController < ApplicationController
	get '/users/:slug' do
		@user = User.find_by_slug(params[:slug])
		erb :'users/show'
	end
	
	get '/signup' do
		if !logged_in?
			erb :'users/new', locals: {message: "Create a new account!"}
		else
			redirect to '/projects'
		end 
	end

	post '/signup' do
		if params[:username] == "" || params[:email] == "" || params[:password] == ""
			redirect to '/signup'
		else
			new_username = params[:username]
			if !User.find_by(:username => new_username)
				@user = User.new(
					:username => params[:username], 
					:email => params[:email], 
					:password => params[:password]
				)
				@user.save
				session[:user_id] = @user.id
				redirect to '/'
			else
				flash[:message] = 'A user with that username already exists. Please try again!'
				redirect to '/signup'
			end
		end
	end

	get '/login' do
		if !logged_in?
			erb :'users/login'
		else
			redirect to '/projects'
		end
	end

	post '/login' do
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect to "/"
		else
			flash[:message] = 'Your profile was not found. Create an account to get started!'
			redirect to '/signup'
		end
	end

	get '/logout' do
		if logged_in?
			session.destroy
			flash[:message] = 'See you later!'
			redirect to '/login'
		else
			redirect to '/'
		end
	end
end