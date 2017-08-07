class Player < ApplicationRecord
  has_many :teams
  has_many :teams, through: :plays_ons
end
