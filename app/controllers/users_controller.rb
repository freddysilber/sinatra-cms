class UsersController < ApplicationController
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end
    
    get '/signup' do
        if !logged_in?
            erb :'users/create_user', locals: {message: "Please sign up before you sign in"}
        else
            redirect to '/tweets'
        end 
    end

end