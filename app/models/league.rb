class League < ApplicationRecord
  has_many :teams, :dependent => :destroy
  has_many :plays_on, :dependent => :destroy
  accepts_nested_attributes_for :teams, :plays_on

  def add_teams
    12.times do |i|
      self.teams.create!(name: "Team #{i}")
    end
  end
end
