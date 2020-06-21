class UserController < ApplicationController


    get '/signup' do
        erb :signup
    end

    post "/signup" do
        @user = User.new(params)
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
            redirect "/collections/new"
        else
            redirect "/failure"
        end
    end


    get "/failure" do
        erb :failure 
    end

    post "/users" do
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:id] = @user.id 
            redirect "/user/#{@user.id}"
        else
            redirect "/failure"
        end
        
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/dashboard'
    end

    get "/logout" do
        session.clear
        redirect "/"
    end

end
