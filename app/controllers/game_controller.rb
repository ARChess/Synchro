class GameController < ApplicationController
  before_filter :require_login

  def index
    @games = Game.all
  end
    
  def show
    @game = Game.find(params["id"])
    @pieces_by_positions = @game.pieces_by_positions
  end

  def update
    game = Game.find(params["id"])
    game.black_player = "Synchro-#{game.id}"
    game.save!
    redirect_to "/game/#{game.id}"
  end

  def destroy
    game = Game.find(params["id"])
    game.delete
    flash[:notice] = "Game Deleted"
    redirect_to "/game"
  end
end
