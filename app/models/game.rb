require 'json'

class Game < ActiveRecord::Base
  def self.find_game(player_id)
    game = Game.find_by_white_player_id_and_game_in_progress(player_id, true)
    if game == nil
      game = Game.find_by_black_player_id_and_game_in_progress(player_id, true)
    end
    return game if game != nil

    game = Game.where(:black_player_id => nil, :game_in_progress => true)
    if game != nil
      game.black_player_id = player_id
      game.save!
    else
      game = Game.new(player_id)
    end
    return game
  end

  def initialize(white_player_id)
    self.game_in_progress = true
    self.current_player = "white"
    self.white_player_id = white_player_id
    self.black_pawn1_x = 6
    self.black_pawn2_x = 6
    self.black_pawn3_x = 6
    self.black_pawn4_x = 6
    self.black_pawn5_x = 6
    self.black_pawn6_x = 6
    self.black_pawn7_x = 6
    self.black_pawn8_x = 6
    self.black_rook1_x = 7
    self.black_rook2_x = 7
    self.black_knight1_x = 7
    self.black_knight2_x = 7
    self.black_bishop1_x = 7
    self.black_bishop2_x = 7
    self.black_queen_x = 7
    self.black_king_x = 7
    self.white_pawn1_x = 1
    self.white_pawn2_x = 1
    self.white_pawn3_x = 1
    self.white_pawn4_x = 1
    self.white_pawn5_x = 1
    self.white_pawn6_x = 1
    self.white_pawn7_x = 1
    self.white_pawn8_x = 1
    self.white_rook1_x = 0
    self.white_rook2_x = 0
    self.white_knight1_x = 0
    self.white_knight2_x = 0
    self.white_bishop1_x = 0
    self.white_bishop2_x = 0
    self.white_queen_x = 0
    self.white_king_x = 0
    self.black_pawn1_y = 0
    self.black_pawn2_y = 1
    self.black_pawn3_y = 2
    self.black_pawn4_y = 3
    self.black_pawn5_y = 4
    self.black_pawn6_y = 5
    self.black_pawn7_y = 6
    self.black_pawn8_y = 7
    self.black_rook1_y = 0
    self.black_rook2_y = 7
    self.black_knight1_y = 1
    self.black_knight2_y = 6
    self.black_bishop1_y = 2
    self.black_bishop2_y = 5
    self.black_queen_y = 3
    self.black_king_y = 4
    self.white_pawn1_y = 0
    self.white_pawn2_y = 1
    self.white_pawn3_y = 2
    self.white_pawn4_y = 3
    self.white_pawn5_y = 4
    self.white_pawn6_y = 5
    self.white_pawn7_y = 6
    self.white_pawn8_y = 7
    self.white_rook1_y = 0
    self.white_rook2_y = 7
    self.white_knight1_y = 1
    self.white_knight2_y = 6
    self.white_bishop1_y = 2
    self.white_bishop2_y = 5
    self.white_queen_y = 4
    self.white_king_y = 3
    self.save!
    self
  end

  def set_state(game)
    self.black_pawn1_x = game["game_state"]["black"]["pawn1"]["x"]
    self.black_pawn2_x = game["game_state"]["black"]["pawn1"]["x"]
    self.black_pawn3_x = game["game_state"]["black"]["pawn1"]["x"]
    self.black_pawn4_x = game["game_state"]["black"]["pawn1"]["x"]
    self.black_pawn5_x = game["game_state"]["black"]["pawn1"]["x"]
    self.black_pawn6_x = game["game_state"]["black"]["pawn1"]["x"]
    self.black_pawn7_x = game["game_state"]["black"]["pawn1"]["x"]
    self.black_pawn8_x = game["game_state"]["black"]["pawn1"]["x"]
    self.black_rook1_x = game["game_state"]["black"]["rook1"]["x"]
    self.black_rook2_x = game["game_state"]["black"]["rook2"]["x"]
    self.black_knight1_x = game["game_state"]["black"]["knight1"]["x"]
    self.black_knight2_x = game["game_state"]["black"]["knight2"]["x"]
    self.black_bishop1_x = game["game_state"]["black"]["bishop2"]["x"]
    self.black_bishop2_x = game["game_state"]["black"]["bishop2"]["x"]
    self.black_queen_x = game["game_state"]["black"]["queen"]["x"]
    self.black_king_x = game["game_state"]["black"]["king"]["x"]
    self.white_pawn1_x = game["game_state"]["white"]["pawn1"]["x"]
    self.white_pawn2_x = game["game_state"]["white"]["pawn2"]["x"]
    self.white_pawn3_x = game["game_state"]["white"]["pawn3"]["x"]
    self.white_pawn4_x = game["game_state"]["white"]["pawn4"]["x"]
    self.white_pawn5_x = game["game_state"]["white"]["pawn5"]["x"]
    self.white_pawn6_x = game["game_state"]["white"]["pawn6"]["x"]
    self.white_pawn7_x = game["game_state"]["white"]["pawn7"]["x"]
    self.white_pawn8_x = game["game_state"]["white"]["pawn8"]["x"]
    self.white_rook1_x = game["game_state"]["white"]["rook1"]["x"]
    self.white_rook2_x = game["game_state"]["white"]["rook2"]["x"]
    self.white_knight1_x = game["game_state"]["white"]["knight1"]["x"]
    self.white_knight2_x = game["game_state"]["white"]["knight2"]["x"]
    self.white_bishop1_x = game["game_state"]["white"]["bishop1"]["x"]
    self.white_bishop2_x = game["game_state"]["white"]["bishop2"]["x"]
    self.white_queen_x = game["game_state"]["white"]["queen"]["x"]
    self.white_king_x = game["game_state"]["white"]["king"]["x"]
    self.black_pawn1_y = game["game_state"]["black"]["pawn1"]["y"]
    self.black_pawn2_y = game["game_state"]["black"]["pawn1"]["y"]
    self.black_pawn3_y = game["game_state"]["black"]["pawn1"]["y"]
    self.black_pawn4_y = game["game_state"]["black"]["pawn1"]["y"]
    self.black_pawn5_y = game["game_state"]["black"]["pawn1"]["y"]
    self.black_pawn6_y = game["game_state"]["black"]["pawn1"]["y"]
    self.black_pawn7_y = game["game_state"]["black"]["pawn1"]["y"]
    self.black_pawn8_y = game["game_state"]["black"]["pawn1"]["y"]
    self.black_rook1_y = game["game_state"]["black"]["rook1"]["y"]
    self.black_rook2_y = game["game_state"]["black"]["rook2"]["y"]
    self.black_knight1_y = game["game_state"]["black"]["knight1"]["y"]
    self.black_knight2_y = game["game_state"]["black"]["knight2"]["y"]
    self.black_bishop1_y = game["game_state"]["black"]["bishop2"]["y"]
    self.black_bishop2_y = game["game_state"]["black"]["bishop2"]["y"]
    self.black_queen_y = game["game_state"]["black"]["queen"]["y"]
    self.black_king_y = game["game_state"]["black"]["king"]["y"]
    self.white_pawn1_y = game["game_state"]["white"]["pawn1"]["y"]
    self.white_pawn2_y = game["game_state"]["white"]["pawn2"]["y"]
    self.white_pawn3_y = game["game_state"]["white"]["pawn3"]["y"]
    self.white_pawn4_y = game["game_state"]["white"]["pawn4"]["y"]
    self.white_pawn5_y = game["game_state"]["white"]["pawn5"]["y"]
    self.white_pawn6_y = game["game_state"]["white"]["pawn6"]["y"]
    self.white_pawn7_y = game["game_state"]["white"]["pawn7"]["y"]
    self.white_pawn8_y = game["game_state"]["white"]["pawn8"]["y"]
    self.white_rook1_y = game["game_state"]["white"]["rook1"]["y"]
    self.white_rook2_y = game["game_state"]["white"]["rook2"]["y"]
    self.white_knight1_y = game["game_state"]["white"]["knight1"]["y"]
    self.white_knight2_y = game["game_state"]["white"]["knight2"]["y"]
    self.white_bishop1_y = game["game_state"]["white"]["bishop1"]["y"]
    self.white_bishop2_y = game["game_state"]["white"]["bishop2"]["y"]
    self.white_queen_y = game["game_state"]["white"]["queen"]["y"]
    self.white_king_y = game["game_state"]["white"]["king"]["y"]
    self.save!
  end

  def change_player
    self.current_player = (self.current_player == "white" ? "black" : "white")
    self.save!
  end

  def resign(player_id)
    self.game_in_progress = false
    self.current_player = nil
    if player_id == self.white_player_id
      self.winner = "black"
    else
      self.winner = "white"
    end
    self.save!
  end
  
  def to_json(player_id)
    {
     game_in_progress: self.game_in_progress,
     player_color: (player_id == self.white_player_id ? "white" : "black"),
     is_current_players_turn: ((player_id == self.white_player_id && current_player == "white") || (player_id != self.white_player_id && current_player == "black") ? true : false),
     is_game_over: (self.white_king_x == nil || self.black_king_x == nil ? true : false),
     winner: (self.white_king_x == nil ? "black" : "white"),
     game_state: {
                  white: {
                          pawn1: { x: self.white_pawn1_x, y: self.white_pawn1_y },
                          pawn2: { x: self.white_pawn2_x, y: self.white_pawn2_y },
                          pawn3: { x: self.white_pawn3_x, y: self.white_pawn3_y },
                          pawn4: { x: self.white_pawn4_x, y: self.white_pawn4_y },
                          pawn5: { x: self.white_pawn5_x, y: self.white_pawn5_y },
                          pawn6: { x: self.white_pawn6_x, y: self.white_pawn6_y },
                          pawn7: { x: self.white_pawn7_x, y: self.white_pawn7_y },
                          pawn8: { x: self.white_pawn8_x, y: self.white_pawn8_y },
                          rook1: { x: self.white_rook1_x, y: self.white_rook1_y },
                          rook2: { x: self.white_rook2_x, y: self.white_rook2_y },
                          knight1: { x: self.white_knight1_x, y: self.white_knight1_y },
                          knight2: { x: self.white_knight2_x, y: self.white_knight2_y },
                          bishop1: { x: self.white_bishop1_x, y: self.white_bishop1_y },
                          bishop2: { x: self.white_bishop2_x, y: self.white_bishop2_y },
                          queen: { x: self.white_queen_x, y: self.white_queen_y },
                          king: { x: self.white_king_x, y: self.white_king_y }
                         },
                  black: {
                          pawn1: { x: self.black_pawn1_x, y: self.black_pawn1_y },
                          pawn2: { x: self.black_pawn2_x, y: self.black_pawn2_y },
                          pawn3: { x: self.black_pawn3_x, y: self.black_pawn3_y },
                          pawn4: { x: self.black_pawn4_x, y: self.black_pawn4_y },
                          pawn5: { x: self.black_pawn5_x, y: self.black_pawn5_y },
                          pawn6: { x: self.black_pawn6_x, y: self.black_pawn6_y },
                          pawn7: { x: self.black_pawn7_x, y: self.black_pawn7_y },
                          pawn8: { x: self.black_pawn8_x, y: self.black_pawn8_y },
                          rook1: { x: self.black_rook1_x, y: self.black_rook1_y },
                          rook2: { x: self.black_rook2_x, y: self.black_rook2_y },
                          knight1: { x: self.black_knight1_x, y: self.black_knight1_y },
                          knight2: { x: self.black_knight2_x, y: self.black_knight2_y },
                          bishop1: { x: self.black_bishop1_x, y: self.black_bishop1_y },
                          bishop2: { x: self.black_bishop2_x, y: self.black_bishop2_y },
                          queen: { x: self.black_queen_x, y: self.black_queen_y },
                          king: { x: self.black_king_x, y: self.black_king_y }
                         }
                 }
    }.to_json
  end
end