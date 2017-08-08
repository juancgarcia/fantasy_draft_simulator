class Plays_onController < ApplicationController
  def new
    @player = Player.find(params[:post_id])
    @plays_on = @player.plays_on.new
  end

  def create
    @player = Player.find(params[:post_id])
    @team = Team.find_or_create_by(name: params[:name])
    @player.plays_on.create(team: @team)
    redirect_to player_path(@player)
  end
end
