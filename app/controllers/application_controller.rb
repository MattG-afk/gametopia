require "./config/env"

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "sphinx"
    end

    get '/' do
        if logged_in?
            redirect "/users/#{current_user.id}"
        else
        erb :home
    end

    helpers do
        def logged_in?
            !!session[:user_id]
        end

        def current_user
           @current_user ||= User.find(session[:user_id])
        end
    end

end