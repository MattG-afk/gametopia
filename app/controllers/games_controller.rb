class GamesController < ApplicationController

    get '/games/new' do
        erb :'/games/new'
    end

end