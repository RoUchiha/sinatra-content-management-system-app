

class PokemonsController < ApplicationController

    get '/pokemons' do
        if logged_in?
            @trainer = Trainer.find(session[:user_id])
            @pokemons = Pokemon.all
            erb :'pokemons/index'
        end
    end

    
    get '/pokemons/new' do
        if logged_in?
            @trainer = Trainer.find(session[:user_id])
            erb :'pokemons/new'
        else
            
        end
    end

    post '/pokemons' do
        if params[:name] == "" || params[:type1] == ""
            erb :'pokemons/new', locals: {message: "Please fill out at least Name and Type!"}
        else
            @pokemon = current_user.pokemons.build(:name => params[:name], :nickname => params[:nickname], :type1 => params[:typr1], :type2 => params[:type2])
            @pokemon.save
            if params[:best_buddy] == 1
                @pokemon.best_buddy = true
            end
            redirect "/pokemons/#{@pokemon.slug}"
        end
    end

    get '/pokemons/:slug' do
        if logged_in?
            @pokemon = Pokemon.find_by_slug(params[:slug])
            erb :'pokemons/show'
        else
            redirect "/login"
        end
    end

end