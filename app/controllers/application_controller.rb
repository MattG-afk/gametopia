class ApplicationController < Sinatra::Base
    set :views, lambda{File.join(root, '../views')}

    get '/' do
        "Hello World"
    end
end