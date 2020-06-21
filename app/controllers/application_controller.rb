require "pry"
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


    get '/signup' do
        erb :signup
    end

    post "/signup" do
       @user = User.new(params)
       binding.pry
       if @user.save
        session[:user_id] = @user.id
            redirect "/login"
       else 
           redirect "/failure"
       end
    end

    get "/login" do
        erb:login
    end

    post "/login" do
        #binding.pry
        @user = User.find_by(username: params[:username])
        #binding.pry
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id 
            redirect "/dashboard"
        else
            redirect "/failure"
        end
    end

    get "/dashboard" do
        if logged_in?
        erb :"dashboard"
        else
        redirect "/login"
        end
    end

    get "/failure" do
        erb :failure 
    end

    get "/logout" do
        session.clear
        redirect "/"
    end

    helpers do
        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find(session[:user_id])
        end
    end

end