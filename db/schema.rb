# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121028123239) do

  create_table "games", :force => true do |t|
    t.boolean  "game_in_progress"
    t.string   "current_player"
    t.string   "winner"
    t.string   "white_player"
    t.string   "black_player"
    t.integer  "black_pawn1_x"
    t.integer  "black_pawn2_x"
    t.integer  "black_pawn3_x"
    t.integer  "black_pawn4_x"
    t.integer  "black_pawn5_x"
    t.integer  "black_pawn6_x"
    t.integer  "black_pawn7_x"
    t.integer  "black_pawn8_x"
    t.integer  "black_rook1_x"
    t.integer  "black_rook2_x"
    t.integer  "black_knight1_x"
    t.integer  "black_knight2_x"
    t.integer  "black_bishop1_x"
    t.integer  "black_bishop2_x"
    t.integer  "black_queen_x"
    t.integer  "black_king_x"
    t.integer  "white_pawn1_x"
    t.integer  "white_pawn2_x"
    t.integer  "white_pawn3_x"
    t.integer  "white_pawn4_x"
    t.integer  "white_pawn5_x"
    t.integer  "white_pawn6_x"
    t.integer  "white_pawn7_x"
    t.integer  "white_pawn8_x"
    t.integer  "white_rook1_x"
    t.integer  "white_rook2_x"
    t.integer  "white_knight1_x"
    t.integer  "white_knight2_x"
    t.integer  "white_bishop1_x"
    t.integer  "white_bishop2_x"
    t.integer  "white_queen_x"
    t.integer  "white_king_x"
    t.integer  "black_pawn1_y"
    t.integer  "black_pawn2_y"
    t.integer  "black_pawn3_y"
    t.integer  "black_pawn4_y"
    t.integer  "black_pawn5_y"
    t.integer  "black_pawn6_y"
    t.integer  "black_pawn7_y"
    t.integer  "black_pawn8_y"
    t.integer  "black_rook1_y"
    t.integer  "black_rook2_y"
    t.integer  "black_knight1_y"
    t.integer  "black_knight2_y"
    t.integer  "black_bishop1_y"
    t.integer  "black_bishop2_y"
    t.integer  "black_queen_y"
    t.integer  "black_king_y"
    t.integer  "white_pawn1_y"
    t.integer  "white_pawn2_y"
    t.integer  "white_pawn3_y"
    t.integer  "white_pawn4_y"
    t.integer  "white_pawn5_y"
    t.integer  "white_pawn6_y"
    t.integer  "white_pawn7_y"
    t.integer  "white_pawn8_y"
    t.integer  "white_rook1_y"
    t.integer  "white_rook2_y"
    t.integer  "white_knight1_y"
    t.integer  "white_knight2_y"
    t.integer  "white_bishop1_y"
    t.integer  "white_bishop2_y"
    t.integer  "white_queen_y"
    t.integer  "white_king_y"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
