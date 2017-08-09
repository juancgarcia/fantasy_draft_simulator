class Team < ApplicationRecord
  belongs_to :league
  has_many :plays_ons
  has_many :players, through: :plays_ons

  # def belongs
  #   @team = Team.find(params[:id])
  #   # @plays_on = PlaysOn.all
  #   @players = @teams.each do |t|
  #     PlaysOn.where(:team_id == t.id).all.each do |p|
  #       p.player.name
  #     end
  #   end
  # end
end
