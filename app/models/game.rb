require 'json'

class Game < ActiveRecord::Base
  def self.find_game(player_id)
    game = Game.all(:conditions => ['white_player = ?', player_id]).last
    if game == nil
      game = Game.all(:conditions => ['black_player = ?', player_id]).last
    end
    return game
  end

  def self.create_game(player_id)
    game = Game.where(:black_player => nil, :game_in_progress => true).first
    if game != nil
      game.black_player = player_id
      game.save!
    else
      game = Game.new
      game.init(player_id)
    end
    return game
  end

  def init(white_player_id)
    self.game_in_progress = true
    self.current_player = "white"
    self.white_player = white_player_id
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
    self.black_in_check = game["black"]["in_check"]
    self.white_in_check = game["white"]["in_check"]
    
	if game["black"]["pawn1"]["masquerading_as"]
		self.black_pawn1_masquerading_as = game["black"]["pawn1"]["masquerading_as"]
		self.black_pawn2_masquerading_as = game["black"]["pawn2"]["masquerading_as"]
		self.black_pawn3_masquerading_as = game["black"]["pawn3"]["masquerading_as"]
		self.black_pawn4_masquerading_as = game["black"]["pawn4"]["masquerading_as"]
		self.black_pawn5_masquerading_as = game["black"]["pawn5"]["masquerading_as"]
		self.black_pawn6_masquerading_as = game["black"]["pawn6"]["masquerading_as"]
		self.black_pawn7_masquerading_as = game["black"]["pawn7"]["masquerading_as"]
		self.black_pawn8_masquerading_as = game["black"]["pawn8"]["masquerading_as"]
		self.black_rook1_masquerading_as = game["black"]["rook1"]["masquerading_as"]
		self.black_rook2_masquerading_as = game["black"]["rook2"]["masquerading_as"]
		self.black_bishop1_masquerading_as = game["black"]["bishop1"]["masquerading_as"]
		self.black_bishop2_masquerading_as = game["black"]["bishop2"]["masquerading_as"]
		self.black_knight1_masquerading_as = game["black"]["knight1"]["masquerading_as"]
		self.black_knight2_masquerading_as = game["black"]["knight2"]["masquerading_as"]
		self.black_queen_masquerading_as = game["black"]["queen"]["masquerading_as"]
		self.black_king_masquerading_as = game["black"]["king"]["masquerading_as"]
	end

	if game["white"]["pawn1"]["masquerading_as"]
		self.white_pawn1_masquerading_as = game["white"]["pawn1"]["masquerading_as"]
		self.white_pawn2_masquerading_as = game["white"]["pawn2"]["masquerading_as"]
		self.white_pawn3_masquerading_as = game["white"]["pawn3"]["masquerading_as"]
		self.white_pawn4_masquerading_as = game["white"]["pawn4"]["masquerading_as"]
		self.white_pawn5_masquerading_as = game["white"]["pawn5"]["masquerading_as"]
		self.white_pawn6_masquerading_as = game["white"]["pawn6"]["masquerading_as"]
		self.white_pawn7_masquerading_as = game["white"]["pawn7"]["masquerading_as"]
		self.white_pawn8_masquerading_as = game["white"]["pawn8"]["masquerading_as"]
		self.white_rook1_masquerading_as = game["white"]["rook1"]["masquerading_as"]
		self.white_rook2_masquerading_as = game["white"]["rook2"]["masquerading_as"]
		self.white_bishop1_masquerading_as = game["white"]["bishop1"]["masquerading_as"]
		self.white_bishop2_masquerading_as = game["white"]["bishop2"]["masquerading_as"]
		self.white_knight1_masquerading_as = game["white"]["knight1"]["masquerading_as"]
		self.white_knight2_masquerading_as = game["white"]["knight2"]["masquerading_as"]
		self.white_queen_masquerading_as = game["white"]["queen"]["masquerading_as"]
		self.white_king_masquerading_as = game["white"]["king"]["masquerading_as"]
	end

    self.black_pawn1_x = game["black"]["pawn1"]["x"]
    self.black_pawn2_x = game["black"]["pawn2"]["x"]
    self.black_pawn3_x = game["black"]["pawn3"]["x"]
    self.black_pawn4_x = game["black"]["pawn4"]["x"]
    self.black_pawn5_x = game["black"]["pawn5"]["x"]
    self.black_pawn6_x = game["black"]["pawn6"]["x"]
    self.black_pawn7_x = game["black"]["pawn7"]["x"]
    self.black_pawn8_x = game["black"]["pawn8"]["x"]
    self.black_rook1_x = game["black"]["rook1"]["x"]
    self.black_rook2_x = game["black"]["rook2"]["x"]
    self.black_knight1_x = game["black"]["knight1"]["x"]
    self.black_knight2_x = game["black"]["knight2"]["x"]
    self.black_bishop1_x = game["black"]["bishop1"]["x"]
    self.black_bishop2_x = game["black"]["bishop2"]["x"]
    self.black_queen_x = game["black"]["queen"]["x"]
    self.black_king_x = game["black"]["king"]["x"]

    self.white_pawn1_x = game["white"]["pawn1"]["x"]
    self.white_pawn2_x = game["white"]["pawn2"]["x"]
    self.white_pawn3_x = game["white"]["pawn3"]["x"]
    self.white_pawn4_x = game["white"]["pawn4"]["x"]
    self.white_pawn5_x = game["white"]["pawn5"]["x"]
    self.white_pawn6_x = game["white"]["pawn6"]["x"]
    self.white_pawn7_x = game["white"]["pawn7"]["x"]
    self.white_pawn8_x = game["white"]["pawn8"]["x"]
    self.white_rook1_x = game["white"]["rook1"]["x"]
    self.white_rook2_x = game["white"]["rook2"]["x"]
    self.white_knight1_x = game["white"]["knight1"]["x"]
    self.white_knight2_x = game["white"]["knight2"]["x"]
    self.white_bishop1_x = game["white"]["bishop1"]["x"]
    self.white_bishop2_x = game["white"]["bishop2"]["x"]
    self.white_queen_x = game["white"]["queen"]["x"]
    self.white_king_x = game["white"]["king"]["x"]
    
    self.black_pawn1_y = game["black"]["pawn1"]["y"]
    self.black_pawn2_y = game["black"]["pawn2"]["y"]
    self.black_pawn3_y = game["black"]["pawn3"]["y"]
    self.black_pawn4_y = game["black"]["pawn4"]["y"]
    self.black_pawn5_y = game["black"]["pawn5"]["y"]
    self.black_pawn6_y = game["black"]["pawn6"]["y"]
    self.black_pawn7_y = game["black"]["pawn7"]["y"]
    self.black_pawn8_y = game["black"]["pawn8"]["y"]
    self.black_rook1_y = game["black"]["rook1"]["y"]
    self.black_rook2_y = game["black"]["rook2"]["y"]
    self.black_knight1_y = game["black"]["knight1"]["y"]
    self.black_knight2_y = game["black"]["knight2"]["y"]
    self.black_bishop1_y = game["black"]["bishop1"]["y"]
    self.black_bishop2_y = game["black"]["bishop2"]["y"]
    self.black_queen_y = game["black"]["queen"]["y"]
    self.black_king_y = game["black"]["king"]["y"]

    self.white_pawn1_y = game["white"]["pawn1"]["y"]
    self.white_pawn2_y = game["white"]["pawn2"]["y"]
    self.white_pawn3_y = game["white"]["pawn3"]["y"]
    self.white_pawn4_y = game["white"]["pawn4"]["y"]
    self.white_pawn5_y = game["white"]["pawn5"]["y"]
    self.white_pawn6_y = game["white"]["pawn6"]["y"]
    self.white_pawn7_y = game["white"]["pawn7"]["y"]
    self.white_pawn8_y = game["white"]["pawn8"]["y"]
    self.white_rook1_y = game["white"]["rook1"]["y"]
    self.white_rook2_y = game["white"]["rook2"]["y"]
    self.white_knight1_y = game["white"]["knight1"]["y"]
    self.white_knight2_y = game["white"]["knight2"]["y"]
    self.white_bishop1_y = game["white"]["bishop1"]["y"]
    self.white_bishop2_y = game["white"]["bishop2"]["y"]
    self.white_queen_y = game["white"]["queen"]["y"]
    self.white_king_y = game["white"]["king"]["y"]
    self.save!
  end

  def pieces_by_positions
    pieces = {
      0 => { },
      1 => { },
      2 => { },
      3 => { },
      4 => { },
      5 => { },
      6 => { },
      7 => { }
    }
    
    pieces[self.white_pawn1_x][self.white_pawn1_y] = "white_pawn1" if self.white_pawn1_x != -1
    pieces[self.white_pawn2_x][self.white_pawn2_y] = "white_pawn2" if self.white_pawn2_x != -1
    pieces[self.white_pawn3_x][self.white_pawn3_y] = "white_pawn3" if self.white_pawn3_x != -1
    pieces[self.white_pawn4_x][self.white_pawn4_y] = "white_pawn4" if self.white_pawn4_x != -1
    pieces[self.white_pawn5_x][self.white_pawn5_y] = "white_pawn5" if self.white_pawn5_x != -1
    pieces[self.white_pawn6_x][self.white_pawn6_y] = "white_pawn6" if self.white_pawn6_x != -1
    pieces[self.white_pawn7_x][self.white_pawn7_y] = "white_pawn7" if self.white_pawn7_x != -1
    pieces[self.white_pawn8_x][self.white_pawn8_y] = "white_pawn8" if self.white_pawn8_x != -1
    pieces[self.white_rook1_x][self.white_rook1_y] = "white_rook1" if self.white_rook1_x != -1
    pieces[self.white_rook2_x][self.white_rook2_y] = "white_rook2" if self.white_rook2_x != -1
    pieces[self.white_bishop1_x][self.white_bishop1_y] = "white_bishop1" if self.white_bishop1_x != -1
    pieces[self.white_bishop2_x][self.white_bishop2_y] = "white_bishop2" if self.white_bishop2_x != -1
    pieces[self.white_knight1_x][self.white_knight1_y] = "white_knight1" if self.white_knight1_x != -1
    pieces[self.white_knight2_x][self.white_knight2_y] = "white_knight2" if self.white_knight2_x != -1
    pieces[self.white_queen_x][self.white_queen_y] = "white_queen" if self.white_queen_x != -1
    pieces[self.white_king_x][self.white_king_y] = "white_king" if self.white_king_x != -1
    
    pieces[self.black_pawn1_x][self.black_pawn1_y] = "black_pawn1" if self.black_pawn1_x != -1
    pieces[self.black_pawn2_x][self.black_pawn2_y] = "black_pawn2" if self.black_pawn2_x != -1
    pieces[self.black_pawn3_x][self.black_pawn3_y] = "black_pawn3" if self.black_pawn3_x != -1
    pieces[self.black_pawn4_x][self.black_pawn4_y] = "black_pawn4" if self.black_pawn4_x != -1
    pieces[self.black_pawn5_x][self.black_pawn5_y] = "black_pawn5" if self.black_pawn5_x != -1
    pieces[self.black_pawn6_x][self.black_pawn6_y] = "black_pawn6" if self.black_pawn6_x != -1
    pieces[self.black_pawn7_x][self.black_pawn7_y] = "black_pawn7" if self.black_pawn7_x != -1
    pieces[self.black_pawn8_x][self.black_pawn8_y] = "black_pawn8" if self.black_pawn8_x != -1
    pieces[self.black_rook1_x][self.black_rook1_y] = "black_rook1" if self.black_rook1_x != -1
    pieces[self.black_rook2_x][self.black_rook2_y] = "black_rook2" if self.black_rook2_x != -1
    pieces[self.black_bishop1_x][self.black_bishop1_y] = "black_bishop1" if self.black_bishop1_x != -1
    pieces[self.black_bishop2_x][self.black_bishop2_y] = "black_bishop2" if self.black_bishop2_x != -1
    pieces[self.black_knight1_x][self.black_knight1_y] = "black_knight1" if self.black_knight1_x != -1
    pieces[self.black_knight2_x][self.black_knight2_y] = "black_knight2" if self.black_knight2_x != -1
    pieces[self.black_queen_x][self.black_queen_y] = "black_queen" if self.black_queen_x != -1
    pieces[self.black_king_x][self.black_king_y] = "black_king" if self.black_king_x != -1

    pieces
  end

  def change_player
    self.current_player = (self.current_player == "white" ? "black" : "white")
    self.save!
  end

  def resign(player_id)
    self.game_in_progress = false
    self.current_player = nil
    if player_id == self.white_player
      self.winner = "black"
    else
      self.winner = "white"
    end
    self.save!
  end
  
  def to_json(player_id)
    {
     game_in_progress: self.game_in_progress,
     player_color: (player_id == self.white_player ? "white" : "black"),
     is_current_players_turn: ((player_id == self.white_player && current_player == "white") || (player_id != self.white_player && current_player == "black") ? true : false),
     is_game_over: (self.white_king_x == -1 || self.black_king_x == -1 ? true : false),
     current_player: self.current_player,
     winner: (self.white_king_x == nil ? "black" : "white"),
     game_state: {
                  white: {
                          in_check: self.white_in_check,
                          pawn1: { x: self.white_pawn1_x, y: self.white_pawn1_y, masquerading_as: self.white_pawn1_masquerading_as },
                          pawn2: { x: self.white_pawn2_x, y: self.white_pawn2_y, masquerading_as: self.white_pawn2_masquerading_as },
                          pawn3: { x: self.white_pawn3_x, y: self.white_pawn3_y, masquerading_as: self.white_pawn3_masquerading_as },
                          pawn4: { x: self.white_pawn4_x, y: self.white_pawn4_y, masquerading_as: self.white_pawn4_masquerading_as },
                          pawn5: { x: self.white_pawn5_x, y: self.white_pawn5_y, masquerading_as: self.white_pawn5_masquerading_as },
                          pawn6: { x: self.white_pawn6_x, y: self.white_pawn6_y, masquerading_as: self.white_pawn6_masquerading_as },
                          pawn7: { x: self.white_pawn7_x, y: self.white_pawn7_y, masquerading_as: self.white_pawn7_masquerading_as },
                          pawn8: { x: self.white_pawn8_x, y: self.white_pawn8_y, masquerading_as: self.white_pawn8_masquerading_as },
                          rook1: { x: self.white_rook1_x, y: self.white_rook1_y, masquerading_as: self.white_rook1_masquerading_as },
                          rook2: { x: self.white_rook2_x, y: self.white_rook2_y, masquerading_as: self.white_rook2_masquerading_as },
                          knight1: { x: self.white_knight1_x, y: self.white_knight1_y, masquerading_as: self.white_knight1_masquerading_as },
                          knight2: { x: self.white_knight2_x, y: self.white_knight2_y, masquerading_as: self.white_knight2_masquerading_as },
                          bishop1: { x: self.white_bishop1_x, y: self.white_bishop1_y, masquerading_as: self.white_bishop1_masquerading_as },
                          bishop2: { x: self.white_bishop2_x, y: self.white_bishop2_y, masquerading_as: self.white_bishop2_masquerading_as },
                          queen: { x: self.white_queen_x, y: self.white_queen_y, masquerading_as: self.white_queen_masquerading_as },
                          king: { x: self.white_king_x, y: self.white_king_y, masquerading_as: self.white_king_masquerading_as }
                         },
                  black: {
                          in_check: self.black_in_check,
                          pawn1: { x: self.black_pawn1_x, y: self.black_pawn1_y, masquerading_as: self.black_pawn1_masquerading_as },
                          pawn2: { x: self.black_pawn2_x, y: self.black_pawn2_y, masquerading_as: self.black_pawn2_masquerading_as },
                          pawn3: { x: self.black_pawn3_x, y: self.black_pawn3_y, masquerading_as: self.black_pawn3_masquerading_as },
                          pawn4: { x: self.black_pawn4_x, y: self.black_pawn4_y, masquerading_as: self.black_pawn4_masquerading_as },
                          pawn5: { x: self.black_pawn5_x, y: self.black_pawn5_y, masquerading_as: self.black_pawn5_masquerading_as },
                          pawn6: { x: self.black_pawn6_x, y: self.black_pawn6_y, masquerading_as: self.black_pawn6_masquerading_as },
                          pawn7: { x: self.black_pawn7_x, y: self.black_pawn7_y, masquerading_as: self.black_pawn7_masquerading_as },
                          pawn8: { x: self.black_pawn8_x, y: self.black_pawn8_y, masquerading_as: self.black_pawn8_masquerading_as },
                          rook1: { x: self.black_rook1_x, y: self.black_rook1_y, masquerading_as: self.black_rook1_masquerading_as },
                          rook2: { x: self.black_rook2_x, y: self.black_rook2_y, masquerading_as: self.black_rook2_masquerading_as },
                          knight1: { x: self.black_knight1_x, y: self.black_knight1_y, masquerading_as: self.black_knight1_masquerading_as },
                          knight2: { x: self.black_knight2_x, y: self.black_knight2_y, masquerading_as: self.black_knight2_masquerading_as },
                          bishop1: { x: self.black_bishop1_x, y: self.black_bishop1_y, masquerading_as: self.black_bishop1_masquerading_as },
                          bishop2: { x: self.black_bishop2_x, y: self.black_bishop2_y, masquerading_as: self.black_bishop2_masquerading_as },
                          queen: { x: self.black_queen_x, y: self.black_queen_y, masquerading_as: self.black_queen_masquerading_as },
                          king: { x: self.black_king_x, y: self.black_king_y, masquerading_as: self.black_king_masquerading_as }
                         }
                 }
    }.to_json
  end
end
