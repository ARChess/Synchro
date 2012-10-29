class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :game_in_progress
      t.string :current_player
      t.string :winner
      t.string :white_player_id
      t.string :black_player_id
      t.integer :black_pawn1_x
      t.integer :black_pawn2_x
      t.integer :black_pawn3_x
      t.integer :black_pawn4_x
      t.integer :black_pawn5_x
      t.integer :black_pawn6_x
      t.integer :black_pawn7_x
      t.integer :black_pawn8_x
      t.integer :black_rook1_x
      t.integer :black_rook2_x
      t.integer :black_knight1_x
      t.integer :black_knight2_x
      t.integer :black_bishop1_x
      t.integer :black_bishop2_x
      t.integer :black_queen_x
      t.integer :black_king_x
      t.integer :white_pawn1_x
      t.integer :white_pawn2_x
      t.integer :white_pawn3_x
      t.integer :white_pawn4_x
      t.integer :white_pawn5_x
      t.integer :white_pawn6_x
      t.integer :white_pawn7_x
      t.integer :white_pawn8_x
      t.integer :white_rook1_x
      t.integer :white_rook2_x
      t.integer :white_knight1_x
      t.integer :white_knight2_x
      t.integer :white_bishop1_x
      t.integer :white_bishop2_x
      t.integer :white_queen_x
      t.integer :white_king_x
      t.integer :black_pawn1_y
      t.integer :black_pawn2_y
      t.integer :black_pawn3_y
      t.integer :black_pawn4_y
      t.integer :black_pawn5_y
      t.integer :black_pawn6_y
      t.integer :black_pawn7_y
      t.integer :black_pawn8_y
      t.integer :black_rook1_y
      t.integer :black_rook2_y
      t.integer :black_knight1_y
      t.integer :black_knight2_y
      t.integer :black_bishop1_y
      t.integer :black_bishop2_y
      t.integer :black_queen_y
      t.integer :black_king_y
      t.integer :white_pawn1_y
      t.integer :white_pawn2_y
      t.integer :white_pawn3_y
      t.integer :white_pawn4_y
      t.integer :white_pawn5_y
      t.integer :white_pawn6_y
      t.integer :white_pawn7_y
      t.integer :white_pawn8_y
      t.integer :white_rook1_y
      t.integer :white_rook2_y
      t.integer :white_knight1_y
      t.integer :white_knight2_y
      t.integer :white_bishop1_y
      t.integer :white_bishop2_y
      t.integer :white_queen_y
      t.integer :white_king_y
      
      t.timestamps
    end
  end
end
