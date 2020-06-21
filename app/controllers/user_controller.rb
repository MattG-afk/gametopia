class UserController < ApplicationController


    get '/signup' do
        erb :signup
    end

    post "/signup" do
       @user = User.new(params)
       #binding.pry
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
        @user = User.find_by(email: params[:email])
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

end
