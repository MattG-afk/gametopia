class ApplicationController < Sinatra::Base
    set :views, ->{File.join(root, '../views')}

    get '/' do
        erb :home
    end
end