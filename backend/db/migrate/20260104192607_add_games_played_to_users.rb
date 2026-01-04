class AddGamesPlayedToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :games_played, :integer
  end
end
