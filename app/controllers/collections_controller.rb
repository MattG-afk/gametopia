class CollectionsController < ApplicationController


    get '/collections' do
        @collection = Collection.all
        erb :'collections/index'
    end

    get '/collections/new' do
        erb :'/collections/new'
    end

    post '/collections/new' do
         if !logged_in?
             redirect '/'
         end

         if params[:name] != "" && params[:genre] != "" && params[:console] != ""
            @collection = Collection.create(params)
            redirect "/collections/#{@collection.id}"
         else
             redirect '/collections/new'
         end
    end

    get '/collections/:id' do
        set_collection
        erb :'/collections/show'
    end

    get '/collections/:id/edit' do
        set_collection
        if logged_in?
            if set_collection.user == @current_user
                erb :'/collections/edit'
            else
                redirect "users/#{current_user.id}"
            end 
        else
            redirect '/'
        end

    end

    get '/collections/search/:name' do
        #binding.pry
        #def search_name
        if @collection = Collection.all.where("name like ?","%#{params[:name]}%")
            #binding.pry
            redirect "/collections/#{@collection.ids[0]}"   
        else
            redirect "/collections/error"
        end
        #end
        #@collection = Collection.all("name like ?", "%#{@collection}%")
        #if @collection.include?(Collection)
          
        #    redirect "/collections/#{@collection.id}"   
        #else
         #   redirect "/"
      #  end

    end
         

    patch '/collections/:id' do
        set_collection
        if logged_in?
                if @collection.user == @current_user
                    @collection.update(name: params[:name], genre: params[:genre], console: params[:console])
                    redirect "/collections/#{@collection.id}"
                else
                    redirect "users/#{current_user.id}"
                end
        else
            redirect '/'
        end
    end

    delete'/collections/:id' do
        set_collection
        if authorized_to_edit?(@collection)
            @collection.destroy
            redirect '/collections'
        else
            redirect '/collections'
        end
    end

    private

    def set_collection
        @collection = Collection.find(params[:id])
    end

end