class Team < ApplicationRecord
  belongs_to :league
  has_many :players, through: :plays_ons
end
