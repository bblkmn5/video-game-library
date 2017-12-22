class UsersController < ApplicationController

    get '/signup' do
        if !session[:user_id]
            erb :'/users/create_user'
        else
            redirect '/consoles' 
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:password] == "" || params[:email] == ""
            redirect '/signup'
        else
            @user = User.create(:username => params[:username], :password => params[:password], :email => params[:email])
            session[:user_id] = @user.id
            redirect '/consoles'
        end
    end

    get '/users/:id' do
       if logged_in?
        redirect '/consoles'
       end

       @user = User.find(params[:id])
       if !@user.nil? && @user == current_user
        erb :'/users/user_library'
       else
        redirect '/consoles'
       end
    end

    get '/login' do
        if logged_in?
            redirect "/consoles"
        else
            erb :'/users/login'
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/consoles'
        else
            redirect '/signup'
        end
    end

    get '/logout' do
        if !session[:user_id] != nil
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end

end
