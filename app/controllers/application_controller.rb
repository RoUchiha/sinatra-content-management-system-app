require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "squirtle_squad_security"
    end

    get '/' do
        if logged_in?
            @trainer = Trainer.find_by_id(session[:user_id])
            redirect "/trainers/#{@trainer.slug}"
        else
            erb :index
        end
    end

    helpers do
        
        def logged_in?
            !!current_user
        end

        def current_user
            @current_user ||= Trainer.find_by(id: session[:user_id]) if session[:user_id]
        end

    end


    
end