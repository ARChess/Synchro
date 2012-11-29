class AddMasqueradeAs < ActiveRecord::Migration
  def up
    add_column :games, :black_pawn1_masquerading_as, :string, :default => "pawn"
    add_column :games, :black_pawn2_masquerading_as, :string, :default => "pawn"
    add_column :games, :black_pawn3_masquerading_as, :string, :default => "pawn"
    add_column :games, :black_pawn4_masquerading_as, :string, :default => "pawn"
    add_column :games, :black_pawn5_masquerading_as, :string, :default => "pawn"
    add_column :games, :black_pawn6_masquerading_as, :string, :default => "pawn"
    add_column :games, :black_pawn7_masquerading_as, :string, :default => "pawn"
    add_column :games, :black_pawn8_masquerading_as, :string, :default => "pawn"
    add_column :games, :black_rook1_masquerading_as, :string, :default => "rook"
    add_column :games, :black_rook2_masquerading_as, :string, :default => "rook"
    add_column :games, :black_bishop1_masquerading_as, :string, :default => "bishop"
    add_column :games, :black_bishop2_masquerading_as, :string, :default => "bishop"
    add_column :games, :black_knight1_masquerading_as, :string, :default => "knight"
    add_column :games, :black_knight2_masquerading_as, :string, :default => "knight"
    add_column :games, :black_queen_masquerading_as, :string, :default => "queen"
    add_column :games, :black_king_masquerading_as, :string, :default => "king"

    add_column :games, :white_pawn1_masquerading_as, :string, :default => "pawn"
    add_column :games, :white_pawn2_masquerading_as, :string, :default => "pawn"
    add_column :games, :white_pawn3_masquerading_as, :string, :default => "pawn"
    add_column :games, :white_pawn4_masquerading_as, :string, :default => "pawn"
    add_column :games, :white_pawn5_masquerading_as, :string, :default => "pawn"
    add_column :games, :white_pawn6_masquerading_as, :string, :default => "pawn"
    add_column :games, :white_pawn7_masquerading_as, :string, :default => "pawn"
    add_column :games, :white_pawn8_masquerading_as, :string, :default => "pawn"
    add_column :games, :white_rook1_masquerading_as, :string, :default => "rook"
    add_column :games, :white_rook2_masquerading_as, :string, :default => "rook"
    add_column :games, :white_bishop1_masquerading_as, :string, :default => "bishop"
    add_column :games, :white_bishop2_masquerading_as, :string, :default => "bishop"
    add_column :games, :white_knight1_masquerading_as, :string, :default => "knight"
    add_column :games, :white_knight2_masquerading_as, :string, :default => "knight"
    add_column :games, :white_queen_masquerading_as, :string, :default => "queen"
    add_column :games, :white_king_masquerading_as, :string, :default => "king"
  end

  def down
    remove_column :games, :black_pawn1_masquerading_as
    remove_column :games, :black_pawn2_masquerading_as
    remove_column :games, :black_pawn3_masquerading_as
    remove_column :games, :black_pawn4_masquerading_as
    remove_column :games, :black_pawn5_masquerading_as
    remove_column :games, :black_pawn6_masquerading_as
    remove_column :games, :black_pawn7_masquerading_as
    remove_column :games, :black_pawn8_masquerading_as
    remove_column :games, :black_rook1_masquerading_as
    remove_column :games, :black_rook2_masquerading_as
    remove_column :games, :black_bishop1_masquerading_as
    remove_column :games, :black_bishop2_masquerading_as
    remove_column :games, :black_knight1_masquerading_as
    remove_column :games, :black_knight2_masquerading_as
    remove_column :games, :black_queen_masquerading_as
    remove_column :games, :black_king_masquerading_as

    remove_column :games, :white_pawn1_masquerading_as
    remove_column :games, :white_pawn2_masquerading_as
    remove_column :games, :white_pawn3_masquerading_as
    remove_column :games, :white_pawn4_masquerading_as
    remove_column :games, :white_pawn5_masquerading_as
    remove_column :games, :white_pawn6_masquerading_as
    remove_column :games, :white_pawn7_masquerading_as
    remove_column :games, :white_pawn8_masquerading_as
    remove_column :games, :white_rook1_masquerading_as
    remove_column :games, :white_rook2_masquerading_as
    remove_column :games, :white_bishop1_masquerading_as
    remove_column :games, :white_bishop2_masquerading_as
    remove_column :games, :white_knight1_masquerading_as
    remove_column :games, :white_knight2_masquerading_as
    remove_column :games, :white_queen_masquerading_as
    remove_column :games, :white_king_masquerading_as
  end
end
