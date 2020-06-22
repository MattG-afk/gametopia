require "./config/env"

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "sphinx"
    end

    get '/' do
        erb :'/home'
    end

    helpers do
        def logged_in?
            !!session[:user_id]
        end

        def current_user
           @current_user = User.find_by(session[:user_id])
        end

        def authorized_to_edit?(collection)
            collection.user == @current_user
        end

    end


end