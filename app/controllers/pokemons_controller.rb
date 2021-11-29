

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
        end
    end

    post '/pokemons' do
        
    end



end