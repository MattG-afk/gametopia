class ApplicationController < Sinatra::Base
    set :views, ->{File.join(root, '../views')}

    get '/' do
        "Hello World"
    end
end