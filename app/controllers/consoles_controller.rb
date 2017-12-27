class ConsolesController < ApplicationController
    get '/consoles' do
        if logged_in?
            @consoles = Console.all
            @user = current_user
            erb :'/users/user_library'
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    get '/consoles/new' do
        if logged_in?
            erb :'/consoles/create_console'
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    post '/consoles' do
        if params[:name] == "" || params[:company] == ""
            redirect '/consoles?error=invalid console'
        else
            @console = Console.find_or_create_by(params)
            @console.user_id = current_user.id
            @console.save
            redirect "/consoles/#{@console.id}"
        end
    end

    get '/consoles/:id' do
        if logged_in?
            @console = Console.find(params[:id])
            erb :'/consoles/show_console'
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    post "/consoles/:id" do
        if logged_in?
            @console = Console.find(params[:id])
            if !@console.errors.any?
                @console.update(params.select {|c| c == "name" || c == "company"})
                redirect "/consoles/#{@console.id}"
            else
                redirect '/consoles?error=invalid console'
            end
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    get '/consoles/:id/edit' do
        if logged_in?
            @console = Console.find(params[:id])
            erb :"/consoles/edit_console"
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    delete '/consoles/:id/delete' do
        if logged_in?
            console = Console.find(params[:id])
            # binding.pry
            if console.user_id == current_user.id
                console.destroy
                redirect '/consoles'
            else
                redirect "/consoles/#{console.id}?error=that is not your console!"
            end
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

end
