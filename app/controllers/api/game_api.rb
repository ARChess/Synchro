require 'sinatra'
require 'json'

module Api
  class GameApi < Sinatra::Base
    before do
      begin
        api_key = nil
        if request.env["HTTP_API_KEY"]
          api_key = request.env["HTTP_API_KEY"]
        else
          api_key = request.env["rack.request.query_hash"]["headers"]["API_KEY"]
        end

        if api_key == 'traprubepreyed2ebupucramunumus4ebewruyUdraga36pacrujavuKep8afref'
          return
        else
          halt 401, {'Content-Type' => 'text/plain'}
        end
      rescue => e
        puts e
        halt 401, {'Content-Type' => 'text/plain'}
      end
    end
    
    get '/' do
      Game.find_game(params["identifier"]).to_json(params["identifier"])
    end

    put '/' do
      request.body.rewind
      body = request.body.read
      puts body
      game_state = JSON.parse(body)
      game = Game.find_game(params["identifier"])
      game.set_state(game_state)
      game.change_player
      { success: true }.to_json
    end

    delete '/' do
      game = Game.find_game(params["identifier"])
      game.resign(params["identifier"])
      { success: true }.to_json
    end

    after do
      response['Access-Control-Allow-Origin'] = '*'
      response['Content-Type'] = 'application/json'
    end
  end
end
