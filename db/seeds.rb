# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Player.destroy_all
League.destroy_all
# Team.destroy_all

# player_csv = CSV.read('db/basic_data.csv')
# player_data = CSV.parse(player_csv, :headers => true, :encoding => 'ISO-8859-1')
# player_data.foreach do |row|
#   t = Player.create
#   t.rank = row['rank']
#   t.name = row['name']
#   t.position = row['position']
#   t.team = row['team']
# end
league1 = League.create(name: 'League One')

drew = Player.create(rank: '1', name: 'Drew Brees', position: 'QB', nfl_team: 'NO')
aaron = Player.create(rank: '2', name: 'Aaron Rogers', position: 'QB', nfl_team: 'GB')
tom = Player.create(rank: '3', name: 'Tom Brady', position: 'QB', nfl_team: 'NE')


# team1 = Team.create(name: 'Team One')
