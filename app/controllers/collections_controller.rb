class CollectionsController < ApplicationController

    get '/collections/new' do
        erb :'/collections/new'
    end

    post '/collections/new' do
         if !logged_in?
             redirect '/'
         end

         if params[:game_name] != "" && params[:genre] != "" && params[:console] != ""
            @collection = Collection.create(params)
            redirect "/collections/#{@collection.id}"
         else
             redirect '/collections/new'
         end
    end

    

end