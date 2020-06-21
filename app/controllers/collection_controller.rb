class CollectionsController < ApplicationController

    get '/collection/new' do
        erb :'/collection/new'
    end

    post '/collection' do
         if !logged_in?
             redirect '/'
         end

         if params[:game_name] != "" && params[:genre] != "" && params[:console] != ""
            @collection = Collection.create(params)
            session[:id] = @user.id 
            redirect "/collection/#{@collection.id}"
         else
             redirect '/collection/new'
         end
    end

end