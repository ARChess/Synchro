class AddCheck < ActiveRecord::Migration
  def up
    add_column :games, :white_in_check, :boolean, :default => false
    add_column :games, :black_in_check, :boolean, :default => false
  end

  def down
    remove_column :games, :white_in_check
    remove_column :games, :black_in_check
  end
end
