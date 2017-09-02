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

CSV.foreach("#{Rails.root}/db/basic_data.csv") do |p|
    player = Player.new(rank: p[0], name: p[1], position: p[2], nfl_team: p[3], tier: p[4])
    player.save!
end
