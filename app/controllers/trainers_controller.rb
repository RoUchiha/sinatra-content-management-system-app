class TrainersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'trainers/new'
        else
            redirect "/trainers"
        end
    end

    post 'signup' do
        
    end



end