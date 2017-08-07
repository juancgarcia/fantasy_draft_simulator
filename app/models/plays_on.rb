class Plays_On < ApplicationRecord
  belongs_to :team
  belongs_to :player
end
