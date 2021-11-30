class TrainersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'trainers/new', locals: {message: "Please create an account before signing in."}
        else
            redirect "/trainers"
        end
    end

    post '/signup' do
        if params[:trainer_name] == "" || params[:gender] == "" || params[:email] == "" || params[:password] == ""
            erb :'trainers/new', locals: {message: "Please fill out all fields!"}
        else
            @trainer = Trainer.new(:trainer_name => params[:trainer_name], :gender => params[:gender], :email => params[:email], :password => params[:password])
            @trainer.save
            session[:user_id] = @trainer.id
            redirect "/trainers/#{@trainer.slug}"
        end
    end

    get '/login' do
        if !logged_in?
            erb :'trainers/login'
        else
            @trainer = Trainer.find_by_id(session[:user_id])
            redirect "/trainers/#{@trainer.slug}"
        end
    end

    post '/login' do
        @trainer = Trainer.find_by(:email => params[:email])

        if @trainer && @trainer.authenticate(params[:password])
            session[:user_id] = @trainer.id
            redirect "/trainers/#{@trainer.slug}"
        else
            erb :'trainers/login', locals: {message: "Email and/or password is incorrect! Please check credentials and try again."}
        end
    end

    get '/trainers/:slug' do
        @trainer = Trainer.find_by_slug(params[:slug])
        @pokemons = Pokemon.all
        erb :'trainers/show'
    end

    get '/trainers/:slug/info' do
        @trainer = Trainer.find_by_slug(params[:slug])
        if logged_in? 
            erb :'trainers/index'
        else
            redirect "/trainers/#{@trainer.slug}"
        end
    end
    
    get '/trainers/:slug/edit' do
        @trainer = Trainer.find_by_slug(params[:slug])
        if logged_in? && session[:user_id] == @trainer.id
            erb :'trainers/edit'
        else 
            redirect "/trainers/:slug"
        end
    end

    patch '/trainers/edit' do
        if params[:trainer_name] == "" || params[:gender] == "" || params[:email] == "" || params[:password] == ""
            @trainer = Trainer.find(session[:user_id])
            erb :'trainers/edit', locals: {message: "You are missing important account information!"}
        else
            @trainer = Trainer.find(session[:user_id])
            @trainer.trainer_name = params[:trainer_name]
            @trainer.gender = params[:gender]
            @trainer.email = params[:email]
            @trainer.password = params[:password]
            @trainer.save
            redirect "/trainers/#{@trainer.slug}"
        end
    end

    get '/logout' do
        if session[:user_id] != nil
            session.destroy
            redirect '/'
        else
            redirect '/'
        end
    end

end