class Team < ApplicationRecord
  belongs_to :league
  has_many :plays_ons
  has_many :players, through: :plays_ons

end
