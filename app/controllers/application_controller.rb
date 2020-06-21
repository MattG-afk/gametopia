require "./config/env"

class ApplicationController < Sinatra::Base
    set :views, ->{File.join(root, '../views')}

    configure do
        enable :sessions
        set :session_secret, "sphinx"
    end

    get '/' do
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