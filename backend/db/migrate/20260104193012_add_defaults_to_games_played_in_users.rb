class AddDefaultsToGamesPlayedInUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_default :users, :games_played, 0
  end
end
