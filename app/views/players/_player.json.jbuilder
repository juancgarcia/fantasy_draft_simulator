json.extract! player, :id, :rank, :name, :position, :nfl_team, :created_at, :updated_at
json.url player_url(player, format: :json)
