class GameController < ApplicationController
  before_filter :require_login

  def index
    @games = Game.all
  end
    
  def show
    @game = Game.find(params["id"])
  end

  def update
    game = Game.find(params["id"])
    game.black_player_id = "Synchro"
    game.save!
    redirect_to "/game/#{game.id}"
  end

  def destroy

  end
end
