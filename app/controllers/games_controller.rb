class GamesController < ApplicationController

    get '/games' do
        erb :'/games/new'
    end

end