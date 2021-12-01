

class PokemonsController < ApplicationController

    get '/pokemons' do
        if logged_in?
            @trainer = Trainer.find(session[:user_id])
            @pokemons = Pokemon.all
            erb :'pokemons/index'
        else
            redirect "/"
        end
    end

    
    get '/pokemons/new' do
        if logged_in?
            @trainer = Trainer.find(session[:user_id])
            erb :'pokemons/new'
        else
            redirect "/"
        end
    end

    post '/pokemons' do
        if params[:name] == "" || params[:type1] == ""
            erb :'pokemons/new', locals: {message: "Please fill out at least Name and Type!"}
        else
            @trainer = Trainer.find(session[:user_id])
            @pokemon = Pokemon.new(name: params[:name], nickname: params[:nickname], type1: params[:type1], type2: params[:type2], trainer_id: @trainer.id)
            
            @pokemon.save
            
            redirect "/pokemons/#{@pokemon.slug}"
        end
    end

    get '/pokemons/:slug' do
        if logged_in?
            @trainer = Trainer.find(session[:user_id])
            @pokemon = Pokemon.find_by_slug(params[:slug])
            erb :'pokemons/show'
        else
            redirect "/"
        end
    end

    get '/pokemons/:slug/edit' do
        @pokemon = Pokemon.find_by_slug(params[:slug])
        @trainer = Trainer.find(session[:user_id])
        if logged_in? 
            if @pokemon.trainer_id == @trainer.id
                erb :'pokemons/edit'
            else
                erb :'pokemons/show', locals: {message: "Sorry, this Pokemon does not belong to your team!"}
            end
        else
            erb :'trainers/login', locals: {message: "Please log in to edit your Pokemon!"}
        end
    end

    patch '/pokemons/:slug' do
        @pokemon = Pokemon.find_by_slug(params[:slug])
        @trainer = Trainer.find(session[:user_id])
    end

end