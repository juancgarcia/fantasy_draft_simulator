require 'team_names'

class League < ApplicationRecord
  has_many :teams, :dependent => :destroy

  def add_teams
    name = TeamNames.team_names.names
    12.times do |i|
      self.teams.create!(name: "Team #{name[i]}")
    end
  end
end
