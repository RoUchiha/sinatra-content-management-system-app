class TrainersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'trainers/new', locals: {message: "Please create an account before signing in"}
        else
            redirect "/trainers"
        end
    end

    post 'signup' do
        
    end



end