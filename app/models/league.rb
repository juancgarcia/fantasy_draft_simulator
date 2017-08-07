class League < ApplicationRecord
  has_many :teams, :dependent => :destroy
  accepts_nested_attributes_for :teams

  def add_teams
    12.times do |i|
      league.teams.create!(name: "Team #{i}")
    end
  end
end
