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

    end

    put '/' do

    end

    delete '/' do

    end

    after do
      response['Access-Control-Allow-Origin'] = '*'
    end
  end
end
