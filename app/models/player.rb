class Player < ApplicationRecord
  has_many :plays_ons
  has_many :teams, through: :plays_ons
end
