class TrainersController < ApplicationController

    get '/trainers/:slug' do
        @trainer = Trainer.find_by_slug(params[:slug])
        @pokemons = Pokemon.all
        erb :'trainers/show'
    end
    


    get '/signup' do
        if !logged_in?
            erb :'trainers/new', locals: {message: "Please create an account before signing in"}
        else
            redirect "/trainers"
        end
    end

    post '/signup' do
        if params[:trainer_name] == "" || params[:gender] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'
        else
            @trainer = Trainer.new(:trainer_name => params[:trainer_name], :gender => params[:gender], :email => params[:email], :password => params[:password])
            @trainer.save
            session[:user_id] = @trainer.id
            redirect "/trainers/#{@trainer.slug}"
        end
    end



end