class ApplicationController < Sinatra::Base
    set :views, ->{File.join(root, '../views')}
    enable :sessions
    set :session_secret,"sphinx"
    end

    get '/' do
        erb :home
    end

    get '/signup'
end