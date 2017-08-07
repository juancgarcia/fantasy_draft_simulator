class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :rank
      t.string :name
      t.string :position
      t.string :nfl_team

      t.timestamps
    end
  end
end
