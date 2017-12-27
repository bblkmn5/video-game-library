class GamesController < ApplicationController
    
    get '/games' do
        if logged_in?
            @games = Game.all
            @user = current_user
            erb :'/games/game_index'
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    get '/games/new' do
        if logged_in?
            @consoles = Console.all
            erb :'/games/create_game'
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    get '/games/:id' do
        if logged_in?
            @game = Game.find(params[:id])
            erb :'/games/show_game'
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    post '/games' do
        if logged_in?
            if params[:name] == "" || params[:esrb_rating] == ""
                redirect '/games?error=invalid game'
            else
                @game = Game.find_or_create_by(params)
                redirect "/games/#{@game.id}"
            end
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    post '/games/:id' do
        if logged_in?
            @game = Game.find(params[:id])
            if !@game.errors.any?
                @game.update(params.select {|g| g == "name" || g == "esrb_rating" || g == "console_id"})
                redirect "/games/#{@game.id}"
            else
                redirect '/games?error=invalid game'
            end
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    get '/games/:id/edit' do
        if logged_in?
            @game = Game.find(params[:id])
            if @game.console.user_id == current_user.id
                erb :'/games/edit_game'
            else
                redirect '/games'
            end
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end

    delete '/games/:id/delete' do
        if logged_in?
            game = Game.find_by_id(params[:id])
            #binding.pry
            if game.console.user_id == current_user.id
               game.destroy
                redirect '/games?error=that is not your game!'
            else
                redirect "/games/#{game.id}"
            end
        else
            redirect '/login?error=you must be logged in to do that'
        end
    end
    

end
