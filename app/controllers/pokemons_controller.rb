

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
            @trainer = Trainer.find(session[:user_id])
            @pokemon = Pokemon.new(name: params[:name], nickname: params[:nickname], type1: params[:type1], type2: params[:type2], trainer_id: @trainer.id)
            if params[:best_buddy] != nil
                @pokemon.best_buddy = true
            end
            @pokemon.save
            
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